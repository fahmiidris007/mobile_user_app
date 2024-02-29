import 'package:dio/dio.dart';
import 'package:mobile_user_app/common/constants/paths.dart';

class ApiClient {
  ApiClient._();

  static final instance = ApiClient._();

  factory ApiClient() {
    return instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Paths.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json
    ),
  );

  // GET
  Future<Map<String, dynamic>> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 200){
        return response.data;
      }
      throw "network error, please try again";
    } catch(e){
      rethrow;
    }
  }

  // POST
  Future<Map<String, dynamic>> post(
      String path, {
        Map<String, dynamic>? data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.post(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 201){
        print("API success. Response: ${response.data}");
        return response.data;
      }
      throw "network error, please try again";
    } catch(e){
      print("API error. Error: $e");
      rethrow;
    }
  }

  // PUT
  Future<Map<String, dynamic>> put(
      String path, {
        Map<String, dynamic>? data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.put(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 200){
        print("API success. Response: ${response.data}");
        return response.data;
      }
      throw "network error, please try again";
    } catch(e){
      print("API error. Error: $e");
      rethrow;
    }
  }

  // DELETE
  Future<Map<String, dynamic>> delete(
      String path, {
        Map<String, dynamic>? data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.delete(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      if(response.statusCode == 200){
        print("API success. Response: ${response.data}");
        return response.data;
      }
      throw "network error, please try again";
    } catch(e){
      print("API error. Error: $e");
      rethrow;
    }
  }
}

