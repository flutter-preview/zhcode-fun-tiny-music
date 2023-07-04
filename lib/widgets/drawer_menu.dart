import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenu extends StatelessWidget {
  final String name;
  final String iconAsset;
  final bool selected;
  final void Function()? onClick;

  const DrawerMenu({
    super.key,
    required this.name,
    required this.iconAsset,
    this.selected = false,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          selected ? Theme.of(context).colorScheme.primary : Colors.transparent,
      borderRadius: BorderRadius.circular(24.w),
      child: InkWell(
        onTap: onClick,
        highlightColor: Colors.transparent,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Container(
          width: 480.w,
          padding: EdgeInsets.all(44.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconAsset,
                width: 60.w,
                height: 60.w,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 28.w),
              Text(
                name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 44.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
