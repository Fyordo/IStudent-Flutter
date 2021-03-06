// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Teacher.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherAdapter extends TypeAdapter<Teacher> {
  @override
  final int typeId = 3;

  @override
  Teacher read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Teacher()
      ..id = fields[0] as int
      ..name = fields[1] as String
      ..degree = fields[2] as String
      ..photo = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Teacher obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.degree)
      ..writeByte(3)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
