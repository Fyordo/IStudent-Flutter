import 'package:flutter/material.dart';

import 'news_vk_list.dart';

class NewsVk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'новости сица мехмата'.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: NewsVkList())
      
    ]);
  }
}


