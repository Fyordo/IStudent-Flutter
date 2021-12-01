import 'package:flutter/material.dart';

import 'news_list.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'новости'.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
          Container(
              margin: EdgeInsets.only(right: 20, top: 20),
              child: Text(
                'смотреть все',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: NewsList())
      
    ]);
  }
}


