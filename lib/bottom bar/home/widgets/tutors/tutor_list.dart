import 'package:flutter/material.dart';

class TutorList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     String avatar =
      'https://elementy.ru/images/eltperson/uchit_erusalimsky_2009.jpg';
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 150.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => Container(
          width: 300,
          height: 150,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: new SizedBox(
                          width: 100.0,
                          height: 180.0,
                          child: Image.network(
                            avatar,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                  'assets/images/user_without_photo.png');
                            },
                          )

                          //),
                          //
                          )),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            'Ерусалимский Яков Михайлович',
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
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
