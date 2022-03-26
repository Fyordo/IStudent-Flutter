part of 'mmcs_news_bloc.dart';

@immutable
abstract class NewsMmcsState {}

class NewsMmcsStateWithNews extends NewsMmcsState{
  final List<NewsMMCS> news_mmcs;
  NewsMmcsStateWithNews({required this.news_mmcs});
}

class NewsMmcsStateWithoutNews extends NewsMmcsState{

}
