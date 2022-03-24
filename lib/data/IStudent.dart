import 'package:url_launcher/url_launcher.dart';

class IStudent {


  static launchAuth() async {
    const url = 'https://i-student.herokuapp.com/auth';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}