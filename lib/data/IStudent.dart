import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:i_student/data/Student.dart';
import 'package:i_student/data/Teacher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import 'Group.dart';
import 'Lesson.dart';
import 'NewsMMCS.dart';
import 'NewsVK.dart';
import 'Schedule.dart';
import 'AllLectures.dart';

class IStudent {
  static launchURL(String url) async {
    Uri address = Uri.parse(url);
    if (!await launchUrl(address)) throw 'Could not launch $url';
  }


  static Future<String> logIn(String login, String password) async {
    Dio dio = new Dio();
    final url = Constants.apiUrl + '/auth/login';

    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["login"] = login;
    dio.options.headers["password"] = password;

    try {
      final response = await dio.post(url);
      Hive.box('tokenbox').put('token', response.data["token"]);
      return "Ok";
    } on DioError catch (e) {
      final _response = e.response?.data["error"] ?? e.message;
      print(_response);
      return _response;
    }
  }

  static Future<void> logOut(String token) async {
    Dio dio = new Dio();
    final url = Constants.apiUrl + '/auth/logout';

    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["token"] = token;

    try {
      final response = await dio.post(url);
      Hive.box('tokenbox').delete('token');
      return;
    } on DioError catch (e) {
      print(e.response);
    }
  }

  static Future<Student> getStudent(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/student/get';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);
      return new Student(response.data);
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<List<NewsMMCS>> getNewsMMCS() async {
    Dio dio = new Dio();
    dynamic url = Constants.newsUrl + '/mmcs';
    try {
      final response = await dio.get(url);
      List<NewsMMCS> res = [];
      for (dynamic item in response.data["result"]) {
        res.add(NewsMMCS(item));
      }
      return res;
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<List<NewsVK>> getNewsVK() async {
    Dio dio = new Dio();
    dynamic url = Constants.newsUrl + '/vk';
    try {
      final response = await dio.get(url);
      print(response.data["result"]);
      List<NewsVK> res = [];
      for (dynamic item in response.data["result"]) {
        res.add(NewsVK(item));
      }
      return res;
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<bool> upWeek(String token) async{
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/schedule/week';

    dio.options.headers["token"] = token;
    try {
      final weekType = await dio.get(url);
      return weekType.data["type"] == "up";
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<Schedule> getSchedule(String token, bool isUpWeek) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/schedule/full';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);
      return isUpWeek ? Schedule.upperWeek(response.data) : Schedule.lowerWeek(response.data);
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<List<Teacher>> getTeachers(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/teacher/all';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);
      List<Teacher> res = [];
      for (dynamic item in response.data) {
        res.add(Teacher.fromData(item));
      }
      return res;
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<List<Lesson>> getTodaySchedule(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/schedule/list';
    DateTime date = DateTime.now();
    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url, data: {
        "day": date.day,
        "month": date.month,
        "year": date.year
      });
      List<Lesson> res = [];
      print(response.data["lessons"]);
      for (dynamic item in response.data["lessons"]) {
        res.add(Lesson.fromData(item));
      }
      return res;
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<Group> getGroup(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/group/get';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);

      return new Group(response.data);
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<List<Student>> getGroupStudents(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/group/students';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);
      List<Student> res = [];
      for (dynamic item in response.data) {
        res.add(Student(item, setGroup: false));
      }
      return res;
    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<AllLectures> getAllLectures(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/schedule/all';

    dio.options.headers["token"] = token;
    DateTime date = DateTime.now();
    try {
      final response = await dio.post(url,
        data: {
          "day": date.day,
          "month": date.month,
          "year": date.year
        },
      );
      return AllLectures.fromData(response.data);

    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }

  static Future<bool> checkToken(String token) async{
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/auth/check';

    dio.options.headers["token"] = token;
    try {
      final response = await dio.post(url);
      return response.data["type"] == 0;

    } on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }
}
