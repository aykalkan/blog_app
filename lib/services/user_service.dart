import 'package:blog_app/controllers/auth_controller.dart';
import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/collection_service.dart';

class UserService {
  final _usersCollection = CollectionService(Collection.users);

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

  Future<void> changeFavouriteStatus(
      String postId, AuthController controller) async {
    User? user = controller.userModel;

    if (user!.favouritePosts!.contains(postId)) {
      user.favouritePosts?.remove(postId);
      controller.userFavourites.remove(postId);
    } else {
      user.favouritePosts?.add(postId);
      controller.userFavourites.add(postId);
    }

    _usersCollection.referance
        .doc(user.id)
        .update({"favouritePosts": user.favouritePosts});
  }
}
