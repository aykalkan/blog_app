import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/collection_service.dart';

class UserService {
  final _usersCollection = CollectionService(Collection.users);
  final _authController = AuthController();

  Future<User?> getUserObjectById(String userId) async {
    try {
      final snapshot = await _usersCollection.findWithId(userId);
      final User? user = User.fromJson(snapshot.data() as Map<String, dynamic>);

      print(user);
      if (user == null)
        throw Exception("User couldn't fetched");
      else
        return user;
    } catch (e) {
      print(e);
    }
  }

  Future<void> addToFavourites(String postId) async {
    final referance =
        _usersCollection.findDocRefById(_authController.currentFirebaseUser!.uid);
    User? user = await _authController.getCurrentUserObject();

    user?.favouritePosts?.add(postId);
    referance.update({"favouritePosts": user!.favouritePosts});
  }
}
