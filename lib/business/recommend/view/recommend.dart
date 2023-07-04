import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiny_music/business/random_albums/view/random_albums.dart';
import 'package:tiny_music/business/random_collection/view/random_collection.dart';
import 'package:tiny_music/business/random_music/view/random_music.dart';
import 'package:tiny_music/business/recommend/cubit/recommend_cubit.dart';
import 'package:tiny_music/widgets/song_cover.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendCubit(),
      child: const RecommendChild(),
    );
  }
}

class RecommendChild extends StatelessWidget {
  const RecommendChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 24.w),
            child: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 44.sp,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    color: Color(0x60000000),
                    offset: Offset.zero,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: SongCover(
                                    radius: 48.r,
                                    url:
                                        'https://p2.music.126.net/fR7snXzA8OnCZ6sFT3MQkw==/109951168692358796.jpg',
                                  ),
                                ),
                                Positioned(
                                  left: 24.w,
                                  right: 24.w,
                                  bottom: 24.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(48.r),
                                    child: SizedBox(
                                      height: 160.w,
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 24.w,
                                          sigmaY: 24.w,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 48.w,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '我的收藏',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 40.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '\n50首',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0x72ffffff),
                                                        fontSize: 32.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 96.w,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 36.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 1,
                                  child: SongCover(
                                    radius: 48.r,
                                    url:
                                        'https://p1.music.126.net/OAaxmYfsDZNXPk9H_h4pMQ==/109951165369903131.jpg',
                                  ),
                                ),
                                Positioned(
                                  left: 24.w,
                                  right: 24.w,
                                  bottom: 24.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(48.r),
                                    child: SizedBox(
                                      height: 160.w,
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 24.w,
                                          sigmaY: 24.w,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 48.w,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '每日推荐',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 40.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text: '\n30首',
                                                      style: TextStyle(
                                                        color: const Color(
                                                            0x72ffffff),
                                                        fontSize: 32.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 96.w,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const RandomMusic(),

          /// 随机歌单
          const RandomCollection(),

          /// 随机专辑
          const RandomAlbums(),
        ],
      ),
    );
  }
}
