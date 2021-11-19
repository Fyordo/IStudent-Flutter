import 'package:flutter/material.dart';

class HeadLessons extends StatelessWidget {
  const HeadLessons({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 150.0,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (BuildContext context, int index) => Container(
                        width: 300,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          child: Center(child: Text('Dummy Card Text')),
                        ),
                      ),
                    ),
                  );
  }
}