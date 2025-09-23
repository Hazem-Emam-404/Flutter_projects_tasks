import 'package:api_training/features/users/data/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://68d18a97e6c0cbeb39a52814.mockapi.io/proj"),
  );
  Future<List> getUsers() async {
    Response res;
    try {
      res = await _dio.get("/users");
      return res.data;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete("/users/$id");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String,dynamic>> editUser(Map<String,dynamic> data) async{
    try{
      final response = await _dio.put("/users/${data['id']}",data: data);
      return response.data;
    }
    catch(e){
      print(e);
    }
    return {};
  }

  Future<Map<String,dynamic>> createUser(Map<String,dynamic> data) async{
    try{
      final response = await _dio.post("/users",data: data);
      return response.data;
    }
    catch(e){
      print(e);
    }
    return {};
  }
}



