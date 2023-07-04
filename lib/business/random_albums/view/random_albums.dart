import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiny_music/business/random_collection/cubit/random_collection_cubit.dart';
import 'package:tiny_music/widgets/song_cover.dart';

class RandomAlbums extends StatelessWidget {
  const RandomAlbums({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomCollectionCubit>(
      create: (context) => RandomCollectionCubit(),
      child: const RandomAlbumsChild(),
    );
  }
}

class RandomAlbumsChild extends StatelessWidget {
  const RandomAlbumsChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 48.w,
        right: 48.w,
        top: 36.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.refresh_rounded,
                size: 64.w,
              ),
              Text(
                '随机专辑',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '更多',
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                size: 32.w,
                color: Theme.of(context).disabledColor,
              ),
            ],
          ),
          SizedBox(height: 36.w),
          SizedBox(
            height: 472.w,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 36.w),
                  width: 340.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SongCover(
                            size: 340.w,
                            radius: 36.r,
                            url:
                                'https://p1.music.126.net/bWeVVpBK-EzsCTXMsgElcA==/109951163571593842.jpg',
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(999),
                                bottomLeft: Radius.circular(999),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 24.w,
                                  sigmaY: 24.w,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 28.w,
                                    right: 12.w,
                                    top: 4.w,
                                    bottom: 4.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '190首',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 12.w,
                            bottom: 12.w,
                            child: Icon(
                              Icons.play_circle_fill_rounded,
                              size: 84.w,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.w),
                      Text(
                        '歌单名称',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 40.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              },
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
