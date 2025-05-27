// import 'dart:io';
import 'package:web/web.dart';
import 'dart:typed_data';

import '../model/restaurant_model.dart';

abstract class IRestaurantService {
  Future<List<Restaurant>> getAllRestaurant();

  Future<Restaurant> addRestaurant(
    Restaurant restaurant,
    Uint8List bytes,
    File file,
  );

  Future<Restaurant> getRestaurantById(String id);

  Future<Restaurant> updateRestaurant(
    String id,
    Restaurant restaurant,
    Uint8List? bytes,
    File? file,
  );

  Future<void> deleteRestaurant(String id);
}
