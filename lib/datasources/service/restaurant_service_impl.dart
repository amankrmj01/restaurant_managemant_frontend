// import 'dart:convert';
import 'dart:developer';

// import 'dart:io';
import 'package:web/web.dart' as web;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../model/restaurant_model.dart';
import 'restaurant_service_contract.dart';

class RestaurantServiceImpl implements IRestaurantService {
  final Dio dio;

  RestaurantServiceImpl(this.dio);

  @override
  Future<List<Restaurant>> getAllRestaurant() async {
    Response response = await dio.get("/api/v1/restaurant/all");

    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      List<Restaurant> allRestaurant = jsonDecoded.map<Restaurant>((json) {
        return Restaurant.fromJson(json);
      }).toList();
      return allRestaurant;
    } else {
      throw Exception("Connection Error");
    }
  }

  @override
  Future<Restaurant> addRestaurant(
    Restaurant restaurant,
    Uint8List bytes,
    web.File file,
  ) async {
    // String filename = file.path.split('/').last;
    String filename = file.name;

    FormData formData = FormData.fromMap({
      'name': restaurant.name,
      'resType': restaurant.resType,
      'rating': restaurant.rating,
      'price': restaurant.price,
      'distance': restaurant.distance,
      'file': MultipartFile.fromBytes(bytes, filename: filename),
    });

    Response response = await dio.post(
      "/api/v1/restaurant/add",
      data: formData,
    );

    if (response.statusCode == 201) {
      var jsonDecoded = response.data;
      return Restaurant.fromJson(jsonDecoded);
    } else {
      throw Exception("Error");
    }
  }

  @override
  Future<void> deleteRestaurant(String id) async {
    Response response = await dio.delete("/api/v1/restaurant/delete/$id");
    if (response.statusCode == 200) {
      log("Restaurant $id deleted");
    } else {
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<Restaurant> getRestaurantById(String id) async {
    Response response = await dio.get("/api/v1/restaurant/$id");
    if (response.statusCode == 200) {
      var json = response.data;
      return Restaurant.fromJson(json);
    } else {
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<Restaurant> updateRestaurant(
    String id,
    Restaurant restaurant,
    Uint8List? bytes,
    web.File? file,
  ) async {
    FormData formData;

    if (bytes != null && file != null) {
      // String filename = file.path.split('/').last;
      String filename = file.name;

      formData = FormData.fromMap({
        'name': restaurant.name,
        'resType': restaurant.resType,
        'rating': restaurant.rating,
        'price': restaurant.price,
        'distance': restaurant.distance,
        'file': MultipartFile.fromBytes(bytes, filename: filename),
      });
    } else {
      formData = FormData.fromMap(restaurant.toJson());
    }

    Response response = await dio.put(
      "/api/v1/restaurant/update/$id",
      data: formData,
    );
    if (response.statusCode == 200) {
      var json = response.data;
      return Restaurant.fromJson(json);
    } else {
      throw Exception("Something went wrong");
    }
  }

  // Add new endpoints for filtering
  Future<List<Restaurant>> getRestaurantsByName(String name) async {
    Response response = await dio.get("/api/v1/restaurant/name=$name");
    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      return jsonDecoded
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    } else {
      throw Exception("Connection Error");
    }
  }

  Future<List<Restaurant>> getRestaurantsByType(String resType) async {
    Response response = await dio.get("/api/v1/restaurant/resType=$resType");
    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      return jsonDecoded
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    } else {
      throw Exception("Connection Error");
    }
  }

  Future<List<Restaurant>> getRestaurantsByDistance(String distance) async {
    Response response = await dio.get("/api/v1/restaurant/distance=$distance");
    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      return jsonDecoded
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    } else {
      throw Exception("Connection Error");
    }
  }

  Future<List<Restaurant>> getRestaurantsByRating(String rating) async {
    Response response = await dio.get("/api/v1/restaurant/rating=$rating");
    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      return jsonDecoded
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    } else {
      throw Exception("Connection Error");
    }
  }

  Future<List<Restaurant>> getRestaurantsByPrice(String price) async {
    Response response = await dio.get("/api/v1/restaurant/price=$price");
    if (response.statusCode == 200) {
      var jsonDecoded = response.data as List;
      return jsonDecoded
          .map<Restaurant>((json) => Restaurant.fromJson(json))
          .toList();
    } else {
      throw Exception("Connection Error");
    }
  }
}
