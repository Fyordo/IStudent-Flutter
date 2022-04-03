import 'package:flutter/material.dart';

class LecturesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          width: 360,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5, bottom: 10),
                      child: Text(
                        'Лекция от 22.11.21',
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        'Преподаватель: ',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
                  Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Ерусалимский Яков Михайлович',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text(
                        'Ссылка на лекцию:',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
                  Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'https://www.google.com/lectures/ls2',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
