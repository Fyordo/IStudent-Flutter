import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:i_student/data/Student.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import 'NewsMMCS.dart';
import 'NewsVK.dart';

class IStudent {
  static launchAuth() async {
    final url = 'https://i-student.herokuapp.com/auth';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> logIn(String login, String password) async {

    Dio dio = new Dio();
    final url = Constants.apiUrl + '/auth/login';

    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["login"] = login;
    dio.options.headers["password"] = password;

    try {
      final response = await dio.get(url);
      Hive.box('tokenbox').put('token', response.data["token"]);
      return;
    }
    on DioError catch (e) {
      print(e.response);
    }
  }

  static Future<Student> getStudent(String token) async {
    Dio dio = new Dio();
    dynamic url = Constants.apiUrl + '/my/student/get';
    dio.options.headers["token"] = token;
    try {
      final response = await dio.get(url);
      return new Student(response.data);
    }
    on DioError catch (e) {
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
      for (dynamic item in response.data["result"]){
        res.add(NewsMMCS(item));
      }
      return res;
    }
    on DioError catch (e) {
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
      for (dynamic item in response.data["result"]){
        res.add(NewsVK(item));
      }
      return res;
    }
    on DioError catch (e) {
      print(e.response);
      throw e;
    }
  }
}