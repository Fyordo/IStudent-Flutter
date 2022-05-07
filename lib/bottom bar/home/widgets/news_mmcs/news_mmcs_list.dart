import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_student/data/IStudent.dart';
import '../../../../constants.dart';
import '../../bloc/mmcs_news/mmcs_news_bloc.dart';
import 'package:i_student/bloc/refresher_bloc/refresher_bloc.dart';

class NewsMmcsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsMmcsBloc>(
      create: (context) {
        return NewsMmcsBloc()
          ..add(NewsMmcsEventWithNews());
      },
      child: BlocListener<RefresherBloc, RefresherState>(
        listener: (context, state) {
          if (state is RefreshState) {
            BlocProvider.of<NewsMmcsBloc>(context)
                .add(NewsMmcsEventWithNews());
          }
        },
        child: BlocBuilder<NewsMmcsBloc, NewsMmcsState>(
          builder: (context, state) {
            if (state is NewsMmcsStateWithNews) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        IStudent.launchURL(Constants.mmcsUrl);
                      },
                      child: ListTile(
                        title: Text(state.news_mmcs[index].text != ""
                            ? state.news_mmcs[index].text.substring(
                                    0,
                                    min(55,
                                        state.news_mmcs[index].text.length)) +
                                "..."
                            : "<новость не содержит текст> "),
                        trailing: Icon(Icons.chevron_right_rounded),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      height: 1,
                      color: Theme.of(context).hintColor,
                    ),
                  ));
            } else if (state is NewsMmcsStateWithoutNews) {
              return Column(
                children: [
                  Container(
                    height: 20,
                  ),
                  Text("Загрузка виджета новостей мехмата..."),
                  Container(
                    height: 20,
                  ),
                  CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              );
            } else
              return Text("Error");
          },
        ),
      ),
    );
  }
}
