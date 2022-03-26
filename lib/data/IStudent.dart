import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

class IStudent {
  static launchAuth() async {
    final url = 'https://i-student.herokuapp.com/auth';
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
      Hive.box('tokenbox').put('token', response.data["token"]);
      print(Hive.box('tokenbox').get('token'));
    }

    on DioError catch (e) {
      print(e.response);
    }
  }

  static getStudent(String token) async {
    Dio dio = new Dio();
    final url = 'https://i-student.herokuapp.com/api/my/student/get';
    dio.options.headers["token"] = token;
    try {
      final response = await dio.get(url);
      print(response.data);
    }
    on DioError catch (e) {
      print(e.response);
    }
  }


}