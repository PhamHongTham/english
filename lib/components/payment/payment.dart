import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';

class CustomAddNewCard extends StatelessWidget {
  const CustomAddNewCard({
    super.key,
    this.hintText,
    this.hintStyle,
    this.onTap,
    this.width,
    this.height,
  });

  final String? hintText;
  final TextStyle? hintStyle;
  final Function()? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //360.w,
      height: height,
      //50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.bgcard,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              // 'Belinda C. Cullen',
              hintStyle: hintStyle
              //AppStyle.text,
              ),
        ),
      ),
    );
  }
}
