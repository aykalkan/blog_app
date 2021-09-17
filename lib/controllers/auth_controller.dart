import 'package:blog_app/services/collection_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:blog_app/models/user.dart' as u;
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionService _usersCollection = CollectionService(Collection.users);

  late Rx<User?> _firebaseUser;
  late Rx<u.User?> _userModel;
  late RxList<String> _userFavourites;

  get user => _firebaseUser.value;
  u.User? get userModel => _userModel.value;
  List<String> get userFavourites => _userFavourites;

  set userFavourites(List<String> value) => _userFavourites.value = value;

  @override
  void onInit() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  @override
  void onReady() async {
    getCurrentUserObject().then((value) {
      if (value == null)
        throw Exception("User not instantiated");
      else {
        _userModel = value.obs;
        _userFavourites = RxList.from(userModel!.favouritePosts ?? []);
      }
      ;
    });
    super.onReady();
  }

  Future<void> createUser(String name, String email, String password) async {
    try {
      final fUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = u.User(
        email: email,
        name: name,
      );

      _usersCollection.addWithId(
        fUser.user!.uid,
        user.toJson(),
      );
    } catch (e) {
      Get.snackbar("Sign up failed!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("--- User ${_auth.currentUser!.uid} connected---");
    } catch (e) {
      Get.snackbar("Login failed!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final u.User user =
        u.User(name: googleUser.displayName!, email: googleUser.email);

    _usersCollection.addWithId(
      credential.idToken!,
      user.toJson(),
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<u.User?> getCurrentUserObject() async {
    try {
      final uid = user.uid;
      final snapshot = await _usersCollection.findWithId(uid);
      return u.User.fromJson(snapshot.data() as Map<String, dynamic>, id: uid);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
