// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/action_buttons.dart';
import 'package:xtendly_test/core/presentation/app_bar/logo.dart';
import 'package:xtendly_test/core/presentation/app_bar/navigation_buttons.dart';

class ResponsiveAppBar extends StatefulWidget {
  final double height;
  const ResponsiveAppBar({
    super.key,
    required this.height,
  });

  @override
  State<ResponsiveAppBar> createState() => _ResponsiveAppBarState();
}

class _ResponsiveAppBarState extends State<ResponsiveAppBar> {
  _ResponsiveAppBarState();

  @override
  Widget build(BuildContext context) {
    final layoutBig = Row(
      children: [
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 38),
            child: const Logo(size: Size(50, 50)),
          ),
        ),
        const ResponsiveVisibility(
          hiddenWhen: [Condition.smallerThan(name: TABLET)],
          child: Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: NavigationButtons(),
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Container(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: ActionButtons(),
            ),
          ),
        )
      ],
    );

    final layoutSmall = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: InkWell(
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Menu button'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: SvgPicture.asset(
              'icons/burger.svg',
              colorFilter:
                  const ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
            ),
          ),
        ),
        const Logo(size: Size(45, 45)),
        const ActionButtons(),
      ],
    );

    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ResponsiveValue(
        context,
        defaultValue: layoutBig,
        valueWhen: [
          Condition.largerThan(name: TABLET, value: layoutBig),
          Condition.smallerThan(name: TABLET, value: layoutSmall)
        ],
      ).value,
    );
  }
}
