import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Form_Field extends StatelessWidget {
  const Text_Form_Field({
    super.key,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.textInputAction,
    this.validator,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  });
  final Color? fillColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final Function()? onTap;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      validator: validator,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        fillColor: fillColor,
        // ColorSchemes.primaryColorScheme.outline,
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        //'Enter your username or email',
        hintStyle: hintStyle,
      ),
    );
  }
}
