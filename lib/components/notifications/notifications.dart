import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationSwitchRow extends StatelessWidget {
  final bool switchValue;
  final Function(bool) onSwitchChanged;
  final String? text;

  const NotificationSwitchRow({
    Key? key,
    required this.switchValue,
    required this.onSwitchChanged,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? '',
          style: AppStyle.text1,
        ),
        Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashRadius: 15.r,
          value: switchValue,
          onChanged: onSwitchChanged,
          inactiveThumbColor: AppColor.sw1,
          trackColor: MaterialStateColor.resolveWith((states) => AppColor.sw1),
          trackOutlineWidth: MaterialStateProperty.all(1.7),
          inactiveTrackColor: AppColor.sw1,
          activeTrackColor: AppColor.sw1,
          activeColor: AppColor.sw2,
        ),
      ],
    );
  }
}
