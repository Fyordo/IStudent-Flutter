part of 'memory_bloc.dart';

@immutable
abstract class MemoryState {}

class MemoryInitial extends MemoryState {}

class MemoryEmptyState extends MemoryState {}

class MemoryPresentState extends MemoryState {}
