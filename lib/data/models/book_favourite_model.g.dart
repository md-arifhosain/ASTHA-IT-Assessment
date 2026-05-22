// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_favourite_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookFavouriteModelAdapter extends TypeAdapter<BookFavouriteModel> {
  @override
  final int typeId = 0;

  @override
  BookFavouriteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookFavouriteModel(
      id: fields[0] as String,
      isFavourite: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BookFavouriteModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookFavouriteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
