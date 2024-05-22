import 'package:english/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomGoogle extends StatelessWidget {
  const CustomGoogle({
    super.key,
    this.text,
    this.style,
    this.onPressed,
    this.isDisable = false,
    this.width,
    this.height,
    this.gradient,
    this.color,
  });
  final String? text;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final bool isDisable;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isDisable ? null : onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 13.0,
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0.0)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.logosGoogleIcon),
              SizedBox(width: 32.0),
              Text(
                text!,
                style: style,
              ),
            ],
          ),
        ));
  }
}
