import 'package:dio/dio.dart';

var dio = Dio(BaseOptions(
  baseUrl: 'https://scpappapi.site/api/SCPTest',
  connectTimeout: 5000,
  receiveTimeout: 3000,

));
