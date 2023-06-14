import 'package:dio/dio.dart';

class DioDetectionHelper {
  static late Dio dio;
  static void initDio() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://general-detection.p.rapidapi.com/v1',
          receiveDataWhenStatusError: true,
          headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'X-RapidAPI-Key':
                '41a7efe98fmsh8a42ac345a26565p1d936djsnf1fdb70ef86c',
            'X-RapidAPI-Host': 'general-detection.p.rapidapi.com'
          }),
    );
  }

  static Future<Response> uploadImageToDetect(var data) async {
    dio.options.headers = {
      'content-type': 'application/x-www-form-urlencoded',
      'X-RapidAPI-Key': '41a7efe98fmsh8a42ac345a26565p1d936djsnf1fdb70ef86c',
      'X-RapidAPI-Host': 'general-detection.p.rapidapi.com'
    };
    return await dio
        .post('/results', data: data, queryParameters: {'algo': 'algo1'});
  }
}
