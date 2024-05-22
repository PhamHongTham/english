import 'package:english/them/them_helper.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Text_Form_Field_Password extends StatefulWidget {
  const Text_Form_Field_Password({
    super.key,
    this.fillColor,
    this.hintText,
    this.hintStyle,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.keyboardType,
  });
  final Color? fillColor;
  final String? hintText;
  final TextStyle? hintStyle;

  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  @override
  State<Text_Form_Field_Password> createState() =>
      _Text_Form_Field_PasswordState();
}

class _Text_Form_Field_PasswordState extends State<Text_Form_Field_Password> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: !showPassword,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none),
        fillColor: widget.fillColor,
        // ColorSchemes.primaryColorScheme.outline,
        filled: true,
        hintText: widget.hintText,
        //'Enter your username or email',
        hintStyle: widget.hintStyle,
        suffixIcon: GestureDetector(
          onTap: () => setState(() => showPassword = !showPassword),
          child: showPassword
              ? Icon(Icons.remove_red_eye_rounded,
                  color: AppColor.brown.withOpacity(0.68))
              : const Icon(Icons.remove_red_eye_outlined,
                  color: AppColor.green),
        ),
      ),
    );
  }
}
