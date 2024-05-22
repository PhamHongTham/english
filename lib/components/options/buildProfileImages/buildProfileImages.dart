// ignore_for_file: camel_case_types

import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class buildProfileImages extends StatelessWidget {
  const buildProfileImages({
    super.key,
    this.width,
    this.height,
    this.image,
    this.left,
    this.right,
    this.bottom,
    this.top,
  });
  final double? width;
  final double? height;
  final String? image;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      // 125.w,
      bottom: bottom,
      //640.h,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.container, // Màu viền
            width: 2.0, // Độ rộng của viền
          ),
        ),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 80.r,
              backgroundImage: const NetworkImage(
                'https://firebasestorage.googleapis.com/v0/b/english-80178.appspot.com/o/avt%2FScreenshot%202023-10-23%20204112.png?alt=media&token=5dd901aa-695a-4d8f-a99b-5eff27f4ac51',
              ),
              // backgroundColor: AppColor.container1,
            ),
            Container(
              margin: EdgeInsets.only(top: 97.h, left: 67.w),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: ColorSchemes.primaryColorScheme.secondary,
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(
                  color: AppColor.container, // Màu viền
                  width: 2.0, // Độ rộng của viền
                ),
              ),
              child: const Icon(
                Icons.image,
                color: AppColor.container,
              ),
            )
          ],
        ),
      ),
    );
  }
}
