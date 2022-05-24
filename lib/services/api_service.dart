import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exceptions.dart';

abstract class ApiService {
  Future<dynamic> get(String url) async {
    var client = http.Client();
    try {
      var response =
          await client.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      switch (response.statusCode) {
        case 200:
          var responseJson = response.body;
          return responseJson;
        case 400:
          throw BadRequestException(response.body.toString());
        case 401:
        case 403:
          throw UnauthorisedException(response.body.toString());
        case 500:
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on TimeoutException {
      throw FetchDataException('Takes to long to load.');
    }
  }
}
