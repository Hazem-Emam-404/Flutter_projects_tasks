import 'package:api_training/features/users/data/user_service.dart';

class UserController {
  final UserService _service = UserService();

  Future<List<dynamic>> fetchUsers() => _service.getUsers();
  Future<void> removeUser(String id) => _service.deleteUser(id);

  Future<Map<String, dynamic>> addUser({
    required String name,
    required int age,
    required String email,
    required String jobTitle,
    required String imageUrl,
  }) async {
    return await _service.createUser({
      'name': name,
      'jobTitle': jobTitle,
      'age': age,
      'imageUrl': imageUrl,
      'email': email,
    });
  }

  Future<Map<String, dynamic>> editUser({
    required String id,
    required String name,
    required int age,
    required String email,
    required String jobTitle,
    required String imageUrl,
  }) async {
    return await _service.editUser({
      'id': id,
      'name': name,
      'jobTitle': jobTitle,
      'age': age,
      'imageUrl': imageUrl,
      'email': email,
    });
  }
}
