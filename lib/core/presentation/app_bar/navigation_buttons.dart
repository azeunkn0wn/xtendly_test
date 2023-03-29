import 'package:extended_wrap/extended_wrap.dart';
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
    return ExtendedWrap(
      alignment: WrapAlignment.center,
      spacing: 30,
      children: [
        for (final item in navItems)
          NavButton(
            text: item,
            onPressed: () {},
          ),
      ],
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
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        fixedSize: const Size(double.infinity, appBarHeight),
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
    );
  }
}
