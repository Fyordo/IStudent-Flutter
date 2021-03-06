import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/bloc/tutorspage_bloc/tutors_page_bloc.dart';
import 'package:i_student/tutorsScreen.dart';
import 'tutor_list.dart';

class Tutors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                    'Ваши преподаватели'.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ),
            Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => BlocProvider(
                              create: (context) =>
                              TutorsPageBloc()
                                ..add(TutorsPageLoadEvent()),
                              child: TutorsPage()),
                        ),
                      );
                    },
                    child: Text(
                        'смотреть все',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                ),
          ],
        ),
        TutorList(),
      ],
    );
  }
}
