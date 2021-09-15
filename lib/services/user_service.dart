import 'package:blog_app/models/user.dart';
import 'package:blog_app/services/collection_service.dart';

class UserService {
  final _usersCollection = CollectionService(Collection.users);

  Future<User?> getUserObjectById(String userId) async {
    try {
      final snapshot = await _usersCollection.findWithId(userId);
      final User? user = User.fromJson(snapshot.data() as Map<String,dynamic>);

      print(user);
      if (user == null) throw Exception("User couldn't fetched");
      else return user;
    } catch (e) {}
  }
}
