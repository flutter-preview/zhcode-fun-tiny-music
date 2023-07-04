// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongAdapter extends TypeAdapter<Song> {
  @override
  final int typeId = 0;

  @override
  Song read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Song(
      id: fields[0] as String,
      parent: fields[1] as String,
      isDir: fields[2] as bool,
      title: fields[3] as String,
      album: fields[4] as String,
      artist: fields[5] as String,
      track: fields[6] as int?,
      year: fields[7] as int?,
      genre: fields[8] as String?,
      coverArt: fields[9] as String,
      size: fields[10] as int,
      contentType: fields[11] as String,
      suffix: fields[12] as String,
      duration: fields[13] as int,
      bitRate: fields[14] as int,
      discNumber: fields[15] as int?,
      path: fields[16] as String,
      created: fields[17] as DateTime,
      albumId: fields[18] as String,
      artistId: fields[19] as String,
      type: fields[20] as String,
      isVideo: fields[21] as bool,
      streamUrl: fields[22] as String,
      coverUrl: fields[23] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Song obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parent)
      ..writeByte(2)
      ..write(obj.isDir)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.album)
      ..writeByte(5)
      ..write(obj.artist)
      ..writeByte(6)
      ..write(obj.track)
      ..writeByte(7)
      ..write(obj.year)
      ..writeByte(8)
      ..write(obj.genre)
      ..writeByte(9)
      ..write(obj.coverArt)
      ..writeByte(10)
      ..write(obj.size)
      ..writeByte(11)
      ..write(obj.contentType)
      ..writeByte(12)
      ..write(obj.suffix)
      ..writeByte(13)
      ..write(obj.duration)
      ..writeByte(14)
      ..write(obj.bitRate)
      ..writeByte(15)
      ..write(obj.discNumber)
      ..writeByte(16)
      ..write(obj.path)
      ..writeByte(17)
      ..write(obj.created)
      ..writeByte(18)
      ..write(obj.albumId)
      ..writeByte(19)
      ..write(obj.artistId)
      ..writeByte(20)
      ..write(obj.type)
      ..writeByte(21)
      ..write(obj.isVideo)
      ..writeByte(22)
      ..write(obj.streamUrl)
      ..writeByte(23)
      ..write(obj.coverUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: json['id'] as String,
      parent: json['parent'] as String,
      isDir: json['isDir'] as bool,
      title: json['title'] as String,
      album: json['album'] as String,
      artist: json['artist'] as String,
      track: json['track'] as int?,
      year: json['year'] as int?,
      genre: json['genre'] as String?,
      coverArt: json['coverArt'] as String,
      size: json['size'] as int,
      contentType: json['contentType'] as String,
      suffix: json['suffix'] as String,
      duration: json['duration'] as int,
      bitRate: json['bitRate'] as int,
      discNumber: json['discNumber'] as int?,
      path: json['path'] as String,
      created: DateTime.parse(json['created'] as String),
      albumId: json['albumId'] as String,
      artistId: json['artistId'] as String,
      type: json['type'] as String,
      isVideo: json['isVideo'] as bool,
      streamUrl: json['streamUrl'] as String,
      coverUrl: json['coverUrl'] as String,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'isDir': instance.isDir,
      'title': instance.title,
      'album': instance.album,
      'artist': instance.artist,
      'track': instance.track,
      'year': instance.year,
      'genre': instance.genre,
      'coverArt': instance.coverArt,
      'size': instance.size,
      'contentType': instance.contentType,
      'suffix': instance.suffix,
      'duration': instance.duration,
      'bitRate': instance.bitRate,
      'discNumber': instance.discNumber,
      'path': instance.path,
      'created': instance.created.toIso8601String(),
      'albumId': instance.albumId,
      'artistId': instance.artistId,
      'type': instance.type,
      'isVideo': instance.isVideo,
      'streamUrl': instance.streamUrl,
      'coverUrl': instance.coverUrl,
    };
