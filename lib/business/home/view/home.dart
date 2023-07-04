import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiny_music/business/home/cubit/home_cubit.dart';
import 'package:tiny_music/business/recommend/view/recommend.dart';
import 'package:tiny_music/widgets/drawer_menu.dart';

class Home extends StatelessWidget {
  static const routeName = '/';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: const HomeChild(),
    );
  }
}

class HomeChild extends StatelessWidget {
  const HomeChild({super.key});

  @override
  Widget build(BuildContext context) {
    final pagesTitleMap = <HomePage, String>{
      // HomePage.recommend: AppLocalizations.of(context)!.recommend,
    };
    // final pageController = PageController();
    final homeCubit = context.watch<HomeCubit>();
    return Stack(
      children: [
        /* Positioned.fill(
          child: MyDrawer(
            pageController: pageController,
            homePageIndex: homePageIndex,
          ),
        ), */
        HomeBody(
          child: const Column(
            children: [
              Expanded(
                child: Recommend(),
                /* child: Visibility(
                  visible: true,
                  replacement: Center(
                    child: MyButton(
                      name: '添加服务地址及账号',
                      onClick: () {
                        Navigator.pushNamed(context, Login.routeName);
                      },
                    ),
                  ),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: (index) {
                      context.read<HomeCubit>().switchPage(index);
                    },
                    children: const [
                      /*  SongList(),
                      Albums(), */
                    ],
                  ),
                ), */
              ),
              // const PlayBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeBody extends StatefulWidget {
  final Widget? child;

  const HomeBody({
    super.key,
    this.child,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double panDistance = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  closeDrawer() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    /* ref.listen<int>(homePageIndex, (prev, next) {
      closeDrawer();
    }); */
    return Transform(
      alignment: Alignment.centerRight,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(_animation.value * 0.6)
        ..translate((_animation.value * 420).w)
        ..scale(1 - _animation.value * 0.1),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((_animation.value * 80).w),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 4,
              blurRadius: 8,
              offset: Offset.zero, // changes position of shadow
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            panDistance = 0;
            if (_controller.value == 1) {
              _controller.reverse();
            }
          },
          onHorizontalDragUpdate: (detail) {
            if (context.size?.width != null && detail.primaryDelta != null) {
              panDistance += detail.delta.dx;
              _controller.value +=
                  detail.primaryDelta! * 2 / context.size!.width;
            }
          },
          onHorizontalDragEnd: (details) {
            if (panDistance >= 0) {
              if (_controller.value >= 0.3) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            } else {
              if (_controller.value <= 0.7) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular((_animation.value * 80).w),
            child: Scaffold(
              appBar: AppBar(
                title: Container(
                  width: double.infinity,
                  height: 96.w,
                  margin: EdgeInsets.only(left: 48.w),
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0x66e5e5e5),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'images/search.svg',
                        width: 40.w,
                        height: 40.w,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).disabledColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(width: 24.w),
                      Text(
                        '搜索音乐、专辑、歌手',
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor,
                        ),
                      )
                    ],
                  ),
                ),
                leading: IconButton(
                  padding: EdgeInsets.only(left: 48.w),
                  iconSize: 68.w,
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () {
                    if (_animation.value == 1) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                ),
                leadingWidth: 68.w,
                /* actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'images/search.svg',
                      width: 60.w,
                      height: 60.w,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ], */
              ),
              body: IgnorePointer(
                ignoring: _controller.value > 0,
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final PageController pageController;
  final int homePageIndex;

  const MyDrawer({
    super.key,
    required this.pageController,
    required this.homePageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
        ),
        child: SizedBox(
          width: 680.w,
          height: 1.sh,
          // color: Colors.orange,
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().statusBarHeight + 40.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 52.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'images/navidrome_logo.svg',
                      width: 148.w,
                      height: 148.w,
                    ),
                    SizedBox(width: 32.w),
                    SizedBox(
                      height: 148.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Navidrome',
                            style: TextStyle(
                              fontSize: 52.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'v0.49.3',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 100.w,
                endIndent: 100.w,
                color: Theme.of(context).dividerColor,
              ),
              Container(
                margin: EdgeInsets.only(top: 48.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: Column(
                  children: [
                    DrawerMenu(
                      iconAsset: 'images/music.svg',
                      name: AppLocalizations.of(context)!.songs,
                      selected: homePageIndex == 0,
                      onClick: () {
                        pageController.jumpToPage(0);
                      },
                    ),
                    DrawerMenu(
                      iconAsset: 'images/album.svg',
                      name: AppLocalizations.of(context)!.albums,
                      selected: homePageIndex == 1,
                      onClick: () {
                        pageController.jumpToPage(1);
                      },
                    ),
                    DrawerMenu(
                      iconAsset: 'images/singer.svg',
                      name: '歌手',
                      selected: homePageIndex == 2,
                      onClick: () {
                        //
                      },
                    ),
                    DrawerMenu(
                      iconAsset: 'images/song_collection.svg',
                      name: '歌单',
                      selected: homePageIndex == 3,
                      onClick: () {
                        //
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 48.w),
                padding: EdgeInsets.symmetric(
                  vertical: 16.w,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: Column(
                  children: [
                    DrawerMenu(
                      iconAsset: 'images/radio.svg',
                      selected: homePageIndex == 4,
                      name: '电台',
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 48.w),
                padding: EdgeInsets.symmetric(
                  vertical: 16.w,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(24.w),
                ),
                child: const Column(
                  children: [
                    DrawerMenu(
                      iconAsset: 'images/setting.svg',
                      name: '设置',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* class PlayBar extends ConsumerWidget {
  const PlayBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCtrl = PlayerCtrl();
    final player = ref.watch(playerProvider);
    final ctrlIcons = <PlayStatus, Widget>{
      PlayStatus.playing: Icon(
        Icons.pause_rounded,
        size: 100.sp,
      ),
      PlayStatus.pause: Icon(
        Icons.play_arrow_rounded,
        size: 100.sp,
      ),
      PlayStatus.loading: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onSurface,
          BlendMode.srcIn,
        ),
        child: Lottie.asset(
          'images/spinner.json',
          width: 80.w,
          height: 80.w,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    };
    return GestureDetector(
      onTap: () {
        if (player.current != null) {
          Navigator.pushNamed(context, MusicPlay.routeName);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border(
            top: BorderSide(
              width: 0.5,
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 36.w,
          vertical: 28.w,
        ),
        child: Row(
          children: [
            Hero(
              tag: 'nd_song_cover',
              child: SongCover(
                url: player.current?.coverUrl,
                size: 132.w,
                radius: 12.r,
              ),
            ),
            SizedBox(width: 28.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.current?.title ?? '小音乐~',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 42.sp,
                      color: Theme.of(context).colorScheme.onSurface,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    player.current?.artist ?? 'ᓚᘏᗢ',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 32.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.8),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                playerCtrl.toggleStatus();
              },
              icon: ctrlIcons[player.playStatus]!,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                playerCtrl.skipNext();
              },
              icon: Icon(
                Icons.skip_next_rounded,
                size: 100.sp,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: const Playlist(),
                    );
                  },
                );
              },
              icon: SvgPicture.asset(
                'images/song_list.svg',
                width: 68.w,
                height: 68.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} */
