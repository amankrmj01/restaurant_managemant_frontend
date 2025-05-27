import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpClientDio {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  HttpClientDio({required this.dio, required this.sharedPreferences}) {
    dio.options.baseUrl = "http://localhost:8080/api/v1";
  }

  Future<Response> get(String url) async {
    try {
      String? token = sharedPreferences.getString("token");
      Response response = await dio.get(
        url,
        options: Options(
          headers: token != null ? {"Authorization": "Bearer $token"} : null,
        ),
      );
      return response;
    } catch (e) {
      log("GET request error: $e");
      rethrow;
    }
  }

  Future<Response> post(String url, dynamic body) async {
    try {
      String? token = sharedPreferences.getString("token");
      Response response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
      return response;
    } catch (e) {
      log("POST request error: $e");
      rethrow;
    }
  }

  Future<Response> put(String url, dynamic body) async {
    try {
      String? token = sharedPreferences.getString("token");
      Response response = await dio.put(
        url,
        data: body,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
      return response;
    } catch (e) {
      log("PUT request error: $e");
      rethrow;
    }
  }

  Future<Response> delete(String url) async {
    try {
      String? token = sharedPreferences.getString("token");
      Response response = await dio.delete(
        url,
        options: Options(
          headers: token != null ? {"Authorization": "Bearer $token"} : null,
        ),
      );
      return response;
    } catch (e) {
      log("DELETE request error: $e");
      rethrow;
    }
  }
}
