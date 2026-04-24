// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_&_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 0;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      img: fields[0] as String?,
      name: fields[1] as String?,
      price: fields[2] as double?,
      rate: fields[3] as double?,
      numberofratings: fields[4] as int?,
      count: fields[6] as int ,
    )..description = fields[5] as String?;
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.img)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.rate)
      ..writeByte(4)
      ..write(obj.numberofratings)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String?,
      lastName: fields[1] as String?,
      phone: fields[2] as int?,
      password: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
