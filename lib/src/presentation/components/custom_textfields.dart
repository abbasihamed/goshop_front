import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 750,
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          border: Border.all(
            color: theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'گوشاپ',
          hintStyle:
              theme.textTheme.subtitle1!.copyWith(color: theme.hintColor),
          suffixIcon: const Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
