import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import 'auth_service_contract.dart';

class AuthServiceImpl implements IAuthService {
  final SharedPreferences sharedPreferences;
  final Dio dio;

  AuthServiceImpl({required this.dio, required this.sharedPreferences});

  @override
  Future<UserModel?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "/auth/signin",
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        sharedPreferences.setString("token", userModel.accessToken);
        return userModel;
      } else {
        throw Exception("Error: ${response.data}");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Sign-in failed");
    }
  }

  @override
  Future<String> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "/auth/signup",
        data: {"userName": username, "email": email, "password": password},
      );

      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        throw Exception("Error: ${response.data}");
      }
    } catch (e) {
      log(e.toString());
      throw Exception("Sign-up failed");
    }
  }
}
