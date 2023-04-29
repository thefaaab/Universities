import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:universities/models/university.model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String url = 'http://universities.hipolabs.com/search';

  Future<List<UniversityModel>> searchUniversity(
      String name, String country) async {
    List<UniversityModel> universities = [];

    try {
      var response = await _dio
          .get(url, queryParameters: {'name': name, 'country': country});
      List data = response.data;
      universities = data.map((d) => UniversityModel.fromJson(d)).toList();
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print(e.message);
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }

    return universities;
  }
}
