import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class IStudent {
  static launchAuth() async {
    const url = 'https://i-student.herokuapp.com/auth';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static logIn(String login, String password) async {
    Dio dio = new Dio();
    final url = 'https://i-student.herokuapp.com/api/auth/login';


    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["login"] = login;
    dio.options.headers["password"] = password;


    try {
      final response = await dio.get(url);
      print(response.data);
      //String token = jsonDecode(response.data)["token"];
      /*await Hive.box('Box').put(token, 0);
      print(Hive.box('Box').get(0));*/
    }
    on DioError catch (e) {
      print(e.response);
    }
  }
}