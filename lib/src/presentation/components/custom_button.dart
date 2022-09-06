import 'package:flutter/material.dart';




class CustomButton extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final double? height;
  final double? width;
  final TextStyle? style;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key,
      required this.theme,
      required this.title,
      required this.onPressed,
      this.height = 60,
      this.width = 150,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            theme.primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: style ??
              theme.textTheme.subtitle1!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
