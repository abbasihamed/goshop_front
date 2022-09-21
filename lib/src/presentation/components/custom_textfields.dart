import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  final ThemeData theme;
  final String? hintText;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final int? maxLines;
  const CustomTextFields({
    Key? key,
    required this.theme,
    this.hintText,
    this.height = 55,
    this.width = 750,
    this.maxLines = 1,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(right: 8),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              theme.textTheme.subtitle1!.copyWith(color: theme.hintColor),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: theme.colorScheme.outline)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: theme.primaryColor)),
        ),
      ),
    );
  }
}
