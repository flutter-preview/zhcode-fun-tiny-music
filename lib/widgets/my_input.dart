import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInput extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool password;
  final Iterable<String>? autofillHints;
  final TextEditingController? controller;

  const MyInput({
    super.key,
    required this.title,
    required this.placeholder,
    this.password = false,
    this.controller,
    this.autofillHints,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      width: 1008.w,
      padding: EdgeInsets.symmetric(horizontal: 36.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(28.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 42.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 60.w),
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: visiblePassword ? false : widget.password,
              autofillHints: widget.autofillHints,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  fontSize: 42.sp,
                  color: const Color(0xff999999),
                  fontWeight: FontWeight.normal,
                ),
                border: InputBorder.none,
                suffixIcon: widget.password
                    ? (InkWell(
                        onTap: () {
                          setState(() {
                            visiblePassword = !visiblePassword;
                          });
                        },
                        child: visiblePassword
                            ? Icon(
                                Icons.visibility_rounded,
                                size: 48.sp,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            : Icon(
                                Icons.visibility_off_rounded,
                                size: 48.sp,
                                color: const Color(0xffB0B3BE),
                              ),
                      ))
                    : null,
              ),
              style: TextStyle(
                fontSize: 42.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
