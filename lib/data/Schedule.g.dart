// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleAdapter extends TypeAdapter<Schedule> {
  @override
  final int typeId = 1;

  @override
  Schedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Schedule()
      ..mon = (fields[0] as List).cast<Lesson>()
      ..tue = (fields[1] as List).cast<Lesson>()
      ..wed = (fields[2] as List).cast<Lesson>()
      ..thu = (fields[3] as List).cast<Lesson>()
      ..fri = (fields[4] as List).cast<Lesson>()
      ..sat = (fields[5] as List).cast<Lesson>();
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mon)
      ..writeByte(1)
      ..write(obj.tue)
      ..writeByte(2)
      ..write(obj.wed)
      ..writeByte(3)
      ..write(obj.thu)
      ..writeByte(4)
      ..write(obj.fri)
      ..writeByte(5)
      ..write(obj.sat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
