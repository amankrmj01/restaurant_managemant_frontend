import 'package:dio/dio.dart';

import '../datasources/api_client/http_client_dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasources/service/auth_service_contract.dart';
import '../datasources/service/auth_service_impl.dart';
import '../datasources/service/restaurant_service_contract.dart';
import '../datasources/service/restaurant_service_impl.dart';
import '../screens/bloc/page_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // getIt.registerLazySingleton<Client>(() => Client());

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPref);

  getIt.registerLazySingleton<HttpClientDio>(
    () => HttpClientDio(dio: getIt(), sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<IAuthService>(
    () => AuthServiceImpl(sharedPreferences: getIt(), dio: getIt()),
  );

  getIt.registerLazySingleton<IRestaurantService>(
    () => RestaurantServiceImpl(getIt()),
  );

  getIt.registerFactory<PageBloc>(() => PageBloc());
}
