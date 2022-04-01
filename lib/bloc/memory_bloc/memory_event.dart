part of 'memory_bloc.dart';

@immutable
abstract class MemoryEvent {}

class MemoryEmptyEvent extends MemoryEvent{}

class MemoryPresentEvent extends MemoryEvent{}