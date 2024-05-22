import 'package:english/components/button/custom_button.dart';
import 'package:english/presentation/user_screen.dart/edit_screen.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonUpDate extends StatelessWidget {
  const ButtonUpDate({
    super.key,
    this.widget,
    this.onPressed,
    this.text,
  });

  final EditScreen? widget;
  final void Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Custom_button(
          color: AppColor.bt,
          borderRadius: BorderRadius.circular(30.0),
          width: 350.w,
          height: 60.h,
          style: AppStyle.button,
          text: text,
          onPressed: onPressed,
        ),
        const Icon(
          Icons.arrow_circle_right_sharp,
          size: 50.0,
          color: Colors.white,
        ),
      ],
    );
  }
}
