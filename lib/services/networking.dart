import 'package:dio/dio.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  final dio = Dio();

  final String url;

  Future<dynamic> getData() async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        return data;
      } else {
        print(response.statusCode);
        return null;
      }
    } catch(e) {
      print('Error: $e');
    }

  }
}
