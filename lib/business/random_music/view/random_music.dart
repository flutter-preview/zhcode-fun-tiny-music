import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiny_music/business/random_music/cubit/random_music_cubit.dart';
import 'package:tiny_music/widgets/song_item.dart';

class RandomMusic extends StatelessWidget {
  const RandomMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomMusicCubit>(
      create: (context) => RandomMusicCubit(),
      child: const RandomMusicChild(),
    );
  }
}

class RandomMusicChild extends StatelessWidget {
  const RandomMusicChild({super.key});

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
                '随机音乐',
                style: TextStyle(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 4.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 52.w,
                    ),
                    Text(
                      '播放',
                      style: TextStyle(
                        fontSize: 32.sp,
                        color: const Color(0xff333333),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
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
          CarouselSlider(
            items: [
              Transform.translate(
                offset: Offset(-96.w, 0),
                child: const Column(
                  children: [
                    SongItem(
                      playing: true,
                    ),
                    SongItem(),
                    SongItem(),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(-96.w, 0),
                child: const Column(
                  children: [
                    SongItem(),
                    SongItem(),
                    SongItem(),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: 0.88,
            ),
          ),
        ],
      ),
    );
  }
}
