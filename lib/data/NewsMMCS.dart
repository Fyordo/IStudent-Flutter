class NewsMMCS {
  late String author;
  late String date;
  late String text;

  NewsMMCS(data) {
    author = data["author"];
    date = data["date"];
    text = data["text"];
  }
}
