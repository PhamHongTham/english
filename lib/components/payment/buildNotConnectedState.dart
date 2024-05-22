import 'package:english/components/options/appBar/appBar.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildNotConnectedState() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 25.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const appBar(
          icon: Icons.keyboard_backspace_sharp,
          text: 'Payment Option',
        ),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          width: 360.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: AppColor.bgcard,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Not Connected',
                  style: AppStyle.textStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
