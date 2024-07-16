// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryTypeAdapter extends TypeAdapter<CategoryType> {
  @override
  final int typeId = 4;

  @override
  CategoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CategoryType.all;
      case 1:
        return CategoryType.other;
      case 2:
        return CategoryType.work;
      case 3:
        return CategoryType.sport;
      case 4:
        return CategoryType.music;
      case 5:
        return CategoryType.education;
      case 6:
        return CategoryType.messengers;
      case 7:
        return CategoryType.movies;
      case 8:
        return CategoryType.books;
      case 9:
        return CategoryType.games;
      default:
        return CategoryType.all;
    }
  }

  @override
  void write(BinaryWriter writer, CategoryType obj) {
    switch (obj) {
      case CategoryType.all:
        writer.writeByte(0);
        break;
      case CategoryType.other:
        writer.writeByte(1);
        break;
      case CategoryType.work:
        writer.writeByte(2);
        break;
      case CategoryType.sport:
        writer.writeByte(3);
        break;
      case CategoryType.music:
        writer.writeByte(4);
        break;
      case CategoryType.education:
        writer.writeByte(5);
        break;
      case CategoryType.messengers:
        writer.writeByte(6);
        break;
      case CategoryType.movies:
        writer.writeByte(7);
        break;
      case CategoryType.books:
        writer.writeByte(8);
        break;
      case CategoryType.games:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
