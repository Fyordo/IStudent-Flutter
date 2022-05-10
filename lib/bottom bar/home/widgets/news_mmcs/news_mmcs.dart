import 'package:flutter/material.dart';

import 'news_mmcs_list.dart';

class NewsMmcs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'новости сайта мехмата'.toUpperCase(),
                style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
        ],
      ),
      Container(
          margin: EdgeInsets.symmetric(horizontal: 10), child: NewsMmcsList())
    ]);
  }
}
