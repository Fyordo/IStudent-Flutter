part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageUserInfoLoaded extends HomePageState {}

class HomePageUserInfoErr extends HomePageState {}

class HomePageLectionsLoaded extends HomePageState {}

class HomePageLectionsErr extends HomePageState {}

class HomePageLectorsLoaded extends HomePageState {}

class HomePageLectorsErr extends HomePageState {}

class HomePageNewsLoaded extends HomePageState {}

class HomePageNewsErr extends HomePageState {}
