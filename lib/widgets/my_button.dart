import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String name;
  final void Function()? onClick;
  final bool disabled;

  const MyButton({
    super.key,
    required this.name,
    this.onClick,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? 0.6 : 1,
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(1.sw),
        child: InkWell(
          onTap: disabled ? null : onClick,
          splashColor: const Color(0x22ffffff),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.sw),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 1008.w,
            height: 150.w,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 48.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
