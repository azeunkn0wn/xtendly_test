import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final Widget? child;

  const CommonButton({
    super.key,
    this.width,
    this.height,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: child,
        ),
      ),
    );
  }
}
