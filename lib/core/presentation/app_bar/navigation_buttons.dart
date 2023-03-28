import 'package:flutter/material.dart';
import 'package:xtendly_test/core/presentation/widget_constants.dart';

class NavigationButtons extends StatefulWidget {
  const NavigationButtons({
    super.key,
  });

  @override
  State<NavigationButtons> createState() => _NavigationButtonsState();
}

class _NavigationButtonsState extends State<NavigationButtons> {
  static const navItems = [
    'HOME',
    'NEW ARRIVAL',
    'SHOP',
    'LAST COLLECTION',
    'MEN',
    'WOMEN',
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final maxWidth = constraints.maxWidth;
        const buttonMinWidth = 100.0;
        final count = maxWidth ~/ buttonMinWidth;
        final buttonCount = count <= navItems.length ? count : navItems.length;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (final item in navItems.take(buttonCount))
              NavButton(
                text: item,
                onPressed: () {},
              ),
          ],
        );
      },
    );
  }
}

class NavButton extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const NavButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(100, appBarHeight),
          padding: EdgeInsets.zero,
          backgroundColor: Colors.black12,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
