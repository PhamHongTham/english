import 'package:english/components/text_title/text_title.dart';
import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class appBar extends StatelessWidget {
  const appBar({
    super.key,
    this.icon,
    this.text,
  });
  final IconData? icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            icon,
            size: 45.0,
            color: ColorSchemes.primaryColorScheme.secondary,
          ),
        ),
        SizedBox(width: 11.79.w),
        Text_Title(
          text: text,
          style: AppStyle.title,
        )
      ],
    );
  }
}
