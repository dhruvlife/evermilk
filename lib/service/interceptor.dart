import 'package:dio/dio.dart';
import 'package:milkride/core/secrets/api_strings.dart';
import 'package:milkride/core/storage/storage_key.dart';
import 'package:milkride/core/storage/storage_object.dart';

class DefaultInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? authToken = await StorageObject.readData(StorageKeys.authToken);
    options.headers[ServerConfig.contentType] = ServerConfig.applicationXWWW;
    options.headers[ServerConfig.accept] = ServerConfig.applicationJson;
    if (authToken != null && authToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }
    options.connectTimeout = const Duration(milliseconds: 20000);
    options.sendTimeout = const Duration(milliseconds: 20000);
    options.receiveTimeout = const Duration(milliseconds: 20000);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
