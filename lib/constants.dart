import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class Constants {
  //static String noInternetPicturePath = 'assets/images/no_internet.png';
  //static String webAdressForPicture = "http://gallery.dev.webant.ru/media/";
  static String _myassetMailName = 'assets/icons/mail_icon.svg';
  static String _myassetEyeName = 'assets/icons/eye_icon.svg';
  static String _myassetUsernameName = 'assets/icons/username_icon.svg';
  static String _myassetCalendarName = 'assets/icons/calendar_icon.svg';
  static String myassetScheduleName = 'assets/icons/calendar.svg';
  static String myassetProfileName = 'assets/icons/profile_icon.svg';
  static String myassetHomeName = 'assets/icons/home_icon.svg';
  static String myassetCameraName = 'assets/icons/chat_icon.svg';
  static String myassetIconAddPhotoName = 'assets/icons/photo_add_icon.svg';
  static String myassetIconAddName = 'assets/icons/add_icon.svg';
  static String myassetIconGroup = 'assets/icons/group.svg';

  static const String apiUrl = "https://i-student.herokuapp.com/api";
  static const String newsUrl = "https://news-sfedu.herokuapp.com/api/news";

  static final Widget svgAddPhotoIcon = SvgPicture.asset(
    myassetIconAddPhotoName,
    width: 200,
  );

  static final Widget svgAddIcon =
      SvgPicture.asset(myassetIconAddName, color: Colors.grey[600]);

  static final Widget svgHomeIcon =
      SvgPicture.asset(myassetHomeName, color: Colors.grey[600]);

  static final Widget svgHomeIconActive =
      SvgPicture.asset(myassetHomeName, color: Constants.hexToColor("#3A5199"));


  static final Widget svgGroupIcon =
      SvgPicture.asset(
          myassetIconGroup,
          color: Colors.grey[600],
          height: 23,
          width: 23
      );

  static final Widget svgGroupIconActive = SvgPicture.asset(
      myassetIconGroup,
      color: Constants.hexToColor("#3A5199"),
      height: 23,
      width: 23
  );

  static final Widget svgScheduleIcon =
      SvgPicture.asset(myassetScheduleName, color: Colors.grey[600], height: 23, width: 23);

  static final Widget svgScheduleIconActive =
      SvgPicture.asset(myassetScheduleName, color: Constants.hexToColor("#3A5199"), height: 23, width: 23);

  static final Widget eyeIcon = SvgPicture.asset(_myassetEyeName,
      color: Colors.grey[600], height: 20, width: 2);

  static final Widget usernameIcon = SvgPicture.asset(_myassetUsernameName,
      color: Colors.grey[600], height: 2, width: 2);

  static final Widget calendarIcon = SvgPicture.asset(_myassetCalendarName,
      color: Colors.grey[600], height: 2, width: 2);

  static final Widget calendarIconActive = SvgPicture.asset(_myassetCalendarName,
      color: Colors.grey[600], height: 2, width: 2);

  static final Widget mailIcon = SvgPicture.asset(_myassetMailName,
      color: Colors.grey[600], height: 2, width: 2);

  static String formatStr(String str) {
    return DateFormat('dd.MM.yyyy').format(DateTime.parse(str));
  }

  static Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }
}
