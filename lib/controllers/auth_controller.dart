import 'package:blog_app/services/collection_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:blog_app/models/user.dart' as u;

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionService _usersCollection = CollectionService(Collection.users);
  late Rx<User?> _firebaseUser;

  get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
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

  Future<u.User?> getCurrentUserObject () async {
    try {
      final uid = user.uid;
      final snapshot = await _usersCollection.findWithId(uid);
      return u.User.fromJson(snapshot.data() as Map<String,dynamic>);
    } catch (e) {
    }
  }
}
