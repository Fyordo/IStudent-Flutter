import 'dart:ffi';

class NewsVK{
  late List files_to_post;
  late String date;
  late String text;

  NewsVK(data){
    files_to_post = data["files_to_post"];
    date = data["date"];
    text = data["text"];
  }
}