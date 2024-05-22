import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems({
    super.key,
    this.text,
    this.assetName,
    this.color,
    this.onTap,
  });
  final String? text;
  final String? assetName;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetName ?? '',
        // ignore: deprecated_member_use
        color: color,
      ),
    );
  }
}
