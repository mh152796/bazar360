import 'package:dio/dio.dart';
import 'package:get/get.dart';


class RequestInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers['Content-Type'] = 'application/json';
    print("${options.headers}");
    options.connectTimeout = const Duration(seconds: 40);
    options.receiveTimeout = const Duration(seconds: 40);
    super.onRequest(options, handler);
  }

}