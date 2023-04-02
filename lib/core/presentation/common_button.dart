import 'package:flutter/material.dart';
import 'package:xtendly_test/core/size_operations.dart';

class CommonButton extends StatelessWidget {
  /// Default button size for desktop
  final Size? size;

  /// Button size for mobile
  final Size? sizeMobile;
  final VoidCallback? onPressed;
  final String text;
  final double? fontSize;

  const CommonButton({
    super.key,
    required this.text,
    this.size,
    this.sizeMobile,
    this.fontSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: desktopOrMobileSize(context, size?.width, sizeMobile?.width)
          as double?,
      height: desktopOrMobileSize(context, size?.height, sizeMobile?.height)
          as double?,
      child: ElevatedButton(
        onPressed: onPressed ??
            () {
              final snackBar = SnackBar(
                content: Text(text),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(11),
          shadowColor: MaterialStateProperty.all(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
