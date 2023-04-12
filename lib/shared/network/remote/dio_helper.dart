import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart%20';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://api.themoviedb.org/3',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio.get<dynamic>(url, queryParameters: query);
  }
}
