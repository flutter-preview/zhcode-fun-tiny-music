import 'package:tiny_music/models/account.dart';
import 'package:tiny_music/server_data/fetch.dart';

class Apis {
  static final _fetch = Fetch();

  static Future<bool> checkServer() {
    return _fetch.get('/rest/ping').then((res) {
      if (res != null) {
        Account().version = res['version'];
        return true;
      }
      return false;
    });
  }

  /* static Future<List<Song>> getRandomSongs(int count) {
    List<Song> songs = [];
    return reqTool.get('/rest/getRandomSongs', {
      "size": count,
    }).then((res) {
      if (res != null && res['randomSongs']?['song'] is List) {
        songs = res['randomSongs']['song'].map<Song>(
          (songMap) {
            final streamUrl = Util.generateStream(songMap['id']);
            final coverUrl = Util.getCoverUrl(songMap['id']);
            songMap['streamUrl'] = streamUrl;
            songMap['coverUrl'] = coverUrl;
            return Song.fromJson(songMap);
          },
        ).toList();
      }
      return songs;
    });
  }

  static Future<List<Album>> getAlbums(int pageNum) {
    List<Album> albums = [];
    return reqTool.get('/rest/getAlbumList', {
      'size': 10,
      'type': 'newest',
      'offset': pageNum * 10,
    }).then((res) {
      if (res != null && res['albumList']?['album'] is List) {
        albums = res['albumList']['album'].map<Album>(
          (albumMap) {
            final coverUrl = Util.getCoverUrl(albumMap['id']);
            albumMap['coverUrl'] = coverUrl;
            return Album.fromJson(albumMap);
          },
        ).toList();
      }
      return albums;
    });
  } */
}
