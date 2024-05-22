import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Title extends StatelessWidget {
  const Text_Title({
    super.key,
    this.text,
    this.style,
  });

  final String? text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: style,
    );
  }
}
