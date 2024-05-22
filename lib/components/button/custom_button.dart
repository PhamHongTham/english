import 'package:flutter/material.dart';

class Custom_button extends StatelessWidget {
  const Custom_button({
    super.key,
    this.text,
    this.style,
    this.onPressed,
    this.isDisable = false,
    this.width,
    this.height,
    this.gradient,
    this.color,
    this.isloading,
    this.borderRadius,
  });
  final String? text;
  final TextStyle? style;
  final VoidCallback? onPressed;
  final bool isDisable;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final Color? color;
  final bool? isloading;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isDisable ? null : onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              //BorderRadius.circular(10.0),
              gradient: gradient,
              color: color,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 13.0,
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0.0,
                )
              ]),
          child: Center(
            child: isloading == true
                ? const CircularProgressIndicator()
                : Text(
                    text!,
                    style: style,
                  ),
          ),
        ));
  }
}
