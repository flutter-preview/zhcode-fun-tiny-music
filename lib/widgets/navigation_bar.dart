import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyNavigationBar extends StatelessWidget {
  final Color? color;

  const MyNavigationBar({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().bottomBarHeight,
      color: color ?? Theme.of(context).colorScheme.surface,
    );
  }
}
