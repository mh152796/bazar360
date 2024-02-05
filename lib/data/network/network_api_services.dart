import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../app_exception.dart';
import 'base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi({required String url, String? bearerToken}) async {
    if (kDebugMode) {
      print(url);
    }


    dynamic headers = {'Authorization': 'Bearer $bearerToken'};
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: bearerToken != null ? headers : null,
          )
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 201 || response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } catch (error) {
      throw "Some thing wrong... $error";
    }
  }
}

//     .onError((error, stackTrace){
// responseStatus.value = Status.Error;
// })