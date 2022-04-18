

class NewsVK {
  late List files_to_post;
  late String date;
  late String text;
  late String url;

  NewsVK(data) {
    files_to_post = data["files_to_post"];
    date = data["date"];
    text = data["text"];
    url = data["post_link"];
  }
}
