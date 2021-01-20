import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/config/environment_config.dart';
import 'package:flutter_boilerplate/config/network/network_exception.dart';
import 'package:flutter_boilerplate/utils/dio_error_util.dart';

class DioClient {
  // dio instance
  final Dio _dio = Dio(BaseOptions(
  connectTimeout: EnvironmentConfig.connectionTimeout,
  receiveTimeout: EnvironmentConfig.receiveTimeout,
  ));


  /// Get:----------------------------------------------------------------------
  Future<dynamic> get(
      String uri, {
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      print(e.toString());
      throw DioErrorUtil.handleError(e);
    }
  }

  /// Post:---------------------------------------------------------------------
  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic> queryParameters,
        Options options,
        CancelToken cancelToken,
        ProgressCallback onSendProgress,
        ProgressCallback onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response.data;
    } catch (e) {
      throw DioErrorUtil.handleError(e);
    }
  }
}