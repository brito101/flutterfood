// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import '../../../constants/api.dart';

Dio dioInterceptor() {
  Dio dio = Dio();

  dio.options.baseUrl = API_URL;
  dio.options.connectTimeout = Duration(seconds: API_CONNECTION_TIMEOUT);
  dio.options.receiveTimeout = Duration(seconds: API_RECEIVE_TIMEOUT);

  return dio;
}
