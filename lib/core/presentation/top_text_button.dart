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
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Help',
            ),
          ),
          topDivider,
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Join Us',
            ),
          ),
          topDivider,
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
            child: const Text(
              'Sign In',
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 30))
        ],
      ),
    );
  }
}
