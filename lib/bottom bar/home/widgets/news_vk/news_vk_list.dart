import 'package:flutter/material.dart';

class NewsVkList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: ListView.separated(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 5,
        
        itemBuilder: (BuildContext context, int index) => ListTile(title: Text("Мехмат объявлен лучшим вузом страны"), trailing: Icon(Icons.chevron_right_rounded),),
         separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Theme.of(context).hintColor,),
      ));
    
  }
}
