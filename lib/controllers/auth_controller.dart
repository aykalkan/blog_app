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
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createUser(String name, String email, String password) async {
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
    }
  }

  void login(String email, String password) async {
    try {
      _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Get.snackbar("Login failed!", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
