import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print('onError executed: ${err.toString()}');
    // print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    if(err.response != null)return handler.resolve(err.response!);
  }

}