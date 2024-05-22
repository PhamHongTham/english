import 'package:english/components/text_title/text_title.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({
    super.key,
    this.icon,
    this.color,
    this.text,
    this.style,
  });

  final IconData? icon;
  final Color? color;
  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon,
            //Icons.lock_person_outlined,
            color: color
            // ColorSchemes.primaryColorScheme.onPrimary,
            ),
        const SizedBox(width: 5.0),
        Text_Title(
            text: text,
            // 'Enter your password',
            style: style),
      ],
    );
  }
}
