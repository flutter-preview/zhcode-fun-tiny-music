part of 'home_cubit.dart';

enum HomePage {
  /// 推荐页面
  recommend,

  /// 所有歌曲
  allSongs,

  /// 所有歌单
  allCollection,

  /// 所有专辑
  allAlbums,

  /// 所有歌手
  allSinger,

  /// 电台页面
  radio,
}

sealed class HomeState extends Equatable {
  const HomeState(this.homePage);

  final HomePage homePage;

  @override
  List<Object> get props => [];
}

class HomeChange extends HomeState {
  const HomeChange(super.homePage);
}
