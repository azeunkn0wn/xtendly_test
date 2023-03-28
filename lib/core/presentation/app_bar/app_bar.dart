import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/logo.dart';
import 'package:xtendly_test/core/presentation/app_bar/navigation_buttons.dart';
import 'package:xtendly_test/core/presentation/widget_constants.dart';

class ResponsiveNavBar extends StatefulWidget {
  const ResponsiveNavBar({
    super.key,
  });

  @override
  State<ResponsiveNavBar> createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {
  _ResponsiveNavBarState();

  @override
  Widget build(BuildContext context) {
    final layoutBig = [
      Flexible(
        flex: 2,
        fit: FlexFit.tight,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 38),
          child: const Logo(),
        ),
      ),
      const ResponsiveVisibility(
        hiddenWhen: [Condition.smallerThan(name: TABLET)],
        child: Expanded(
          flex: 4,
          child: NavigationButtons(),
        ),
      ),
      const Flexible(
        flex: 2,
        fit: FlexFit.tight,
        child: ActionButtons(),
      )
    ];
    final layoutSmall = [
      const Logo(),
      const ActionButtons(),
    ];

    return Positioned(
      top: topSpacing,
      left: 0,
      right: 0,
      child: SizedBox.fromSize(
        size: const Size.fromHeight(appBarHeight),
        child: Container(
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
          child: Row(
            children: ResponsiveValue(
              context,
              defaultValue: layoutBig,
              valueWhen: [
                Condition.largerThan(name: TABLET, value: layoutBig),
                Condition.smallerThan(name: TABLET, value: layoutSmall)
              ],
            ).value!,
          ),
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Icon(Icons.search),
        SizedBox(width: 20),
        Icon(Icons.shopping_cart),
        SizedBox(width: 20),
      ],
    );
  }
}
