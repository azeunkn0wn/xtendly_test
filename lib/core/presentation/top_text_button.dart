import 'package:flutter/material.dart';
import 'package:xtendly_test/core/presentation/widget_constants.dart';

class TopTextButtons extends StatelessWidget {
  const TopTextButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const topDivider = SizedBox(
      height: topSpacingTextSize,
      child: VerticalDivider(
        thickness: 1,
        color: Colors.black,
        width: 0,
      ),
    );

    return SizedBox(
      height: topSpacing,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          TopTextButtonWidget('Help'),
          topDivider,
          TopTextButtonWidget('Join Us'),
          topDivider,
          TopTextButtonWidget('Sign In'),
          Padding(padding: EdgeInsets.only(right: 30))
        ],
      ),
    );
  }
}

class TopTextButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const TopTextButtonWidget(
    this.text, {
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onPressed ??
          () {
            final snackBar = SnackBar(
              content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
      child: Text(
        text,
      ),
    );
  }
}
