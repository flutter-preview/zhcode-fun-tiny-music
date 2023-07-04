import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tiny_music/models/song.dart';
import 'package:tiny_music/widgets/song_cover.dart';

class SongItem extends StatelessWidget {
  const SongItem({
    super.key,
    this.song,
    this.playing = false,
  });

  final Song? song;
  final bool playing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36.w, left: 48.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SongCover(
            url:
                'https://p1.music.126.net/MDkRHw-gAcepI9Cybl2IOQ==/109951164527778960.jpg',
            radius: 24.r,
            size: 140.w,
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: SizedBox(
              height: 136.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '城府可适当距离喀什打开拉萨扩大撒赖',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // SizedBox(height: 4.w),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        margin: EdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff747474),
                          ),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          // song.suffix.toUpperCase(),
                          'FLAC',
                          style: TextStyle(
                            fontSize: 20.sp,
                            height: 1.4,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff747474),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          // '${song.artist}·${song.album}',
                          '许嵩',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 32.sp,
                            color: const Color(0xff747474),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          playing
              ? Lottie.asset(
                  'images/spinner.json',
                  width: 96.w,
                  height: 96.w,
                  fit: BoxFit.cover,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
