// ignore_for_file: camel_case_types

import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class build_ProfileOption extends StatelessWidget {
  const build_ProfileOption({
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
        Icon(
          icon,
        ),
        SizedBox(width: 14.w),
        Text(
          text ?? '',
          style: AppStyle.text,
        )
      ],
    );
  }
}
