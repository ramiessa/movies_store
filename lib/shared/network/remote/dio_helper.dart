import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../models/shop_app/categories_model.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://darsoft.b-cdn.net",
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<Response> getData({
    String? url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    return await dio!.get(
      "https://darsoft.b-cdn.net/movies_categories.json",
    );
  }
}
