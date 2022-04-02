import 'package:flutter/material.dart';

class LessonsTableList extends StatelessWidget {
  const LessonsTableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 8,
      ),
      height: 170.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: 300,
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
                      margin: EdgeInsets.only(left: 5, bottom:10),
                      child: Text(
                        'Алгебра Геометрия',
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )),
                  Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          
                          'Диффиренциалы 2го порядка',
                          style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        )),
                        

                        
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5, top:10),
                      child: Text(
                        'Ближайшая пара: 12.04.21',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),

                    Container(
                      margin: EdgeInsets.only(left: 5, top:5),
                      child: Text(
                        'Ближайшая кр:      01.08.21',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      )),
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
