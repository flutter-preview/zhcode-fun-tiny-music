import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@HiveType(typeId: 0, adapterName: "SongAdapter")
@JsonSerializable()
class Song {
  const Song({
    required this.id,
    required this.parent,
    required this.isDir,
    required this.title,
    required this.album,
    required this.artist,
    this.track,
    this.year,
    this.genre,
    required this.coverArt,
    required this.size,
    required this.contentType,
    required this.suffix,
    required this.duration,
    required this.bitRate,
    this.discNumber,
    required this.path,
    required this.created,
    required this.albumId,
    required this.artistId,
    required this.type,
    required this.isVideo,
    required this.streamUrl,
    required this.coverUrl,
  });

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String parent;
  @HiveField(2)
  final bool isDir;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String album;
  @HiveField(5)
  final String artist;
  @HiveField(6)
  final int? track;
  @HiveField(7)
  final int? year;
  @HiveField(8)
  final String? genre;
  @HiveField(9)
  final String coverArt;
  @HiveField(10)
  final int size;
  @HiveField(11)
  final String contentType;
  @HiveField(12)
  final String suffix;
  @HiveField(13)
  final int duration;
  @HiveField(14)
  final int bitRate;
  @HiveField(15)
  final int? discNumber;
  @HiveField(16)
  final String path;
  @HiveField(17)
  final DateTime created;
  @HiveField(18)
  final String albumId;
  @HiveField(19)
  final String artistId;
  @HiveField(20)
  final String type;
  @HiveField(21)
  final bool isVideo;
  @HiveField(22)
  final String streamUrl;
  @HiveField(23)
  final String coverUrl;
}
