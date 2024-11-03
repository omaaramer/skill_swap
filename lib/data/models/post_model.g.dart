// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SkillModelAdapter extends TypeAdapter<SkillModel> {
  @override
  final int typeId = 0;

  @override
  SkillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SkillModel(
      skillId: fields[7] as String?,
      userId: fields[6] as String,
      mySkill: fields[0] as String?,
      skillNeeded: fields[1] as String?,
      description: fields[2] as String?,
      skillImage: fields[3] as String?,
      isOnline: fields[4] as String,
      dateTime: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SkillModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.mySkill)
      ..writeByte(1)
      ..write(obj.skillNeeded)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.skillImage)
      ..writeByte(4)
      ..write(obj.isOnline)
      ..writeByte(5)
      ..write(obj.dateTime)
      ..writeByte(6)
      ..write(obj.userId)
      ..writeByte(7)
      ..write(obj.skillId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
