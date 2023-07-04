import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://ec2c-172-99-188-71.ngrok-free.app/',
        receiveDataWhenStatusError: true,
        headers: {
          'accept':'application/json',
          'Content-Type':'application/json',
        }
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic> ?query,
  }) async
     {
       return await dio.get(
         url,
         queryParameters: query,
       );
     }

  static Future<Response> postData({
    required String url,
    required var data,
  }) async
  {
    return await dio.post(
      url,
      data: data
    );
  }


  static Future<Response> postImage({
    required String url,
    required var data,
  }) async
  {
    dio.options.headers['accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    return await dio.post(
        url,
        data: data
    );
  }



}