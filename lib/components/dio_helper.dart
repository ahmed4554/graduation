import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://donw-syndrome.onrender.com/',
        receiveDataWhenStatusError: true,
        headers: {
          'accept':'application/json',
          'Content-Type':'application/json'
        }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async
     {
       return await dio.get(
         url,
         queryParameters: query,
       );
     }

  static Future<Response> postData({
    required String url,
    required Map<String,dynamic> data,
  }) async
  {
    return await dio.post(
      url,
      data: data
    );
  }
}