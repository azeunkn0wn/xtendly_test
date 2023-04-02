import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/search_bar.dart';

// I did not bother following the alignments for these elements since the figma design have many inconsistent alignments, so I assumed they're not important.
class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });
  static const badgeCount = 0;

  @override
  Widget build(BuildContext context) {
    const double dividerPadding = 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const ResponsiveVisibility(
          hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
          child: Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: dividerPadding, right: 17),
              child: SearchField(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: dividerPadding),
          child: badges.Badge(
            badgeContent: Text(
              badgeCount.toString(),
              style: const TextStyle(fontSize: 7),
            ),
            position: badges.BadgePosition.bottomEnd(bottom: -5, end: -5),
            badgeStyle: const badges.BadgeStyle(
              padding: EdgeInsets.all(4),
              badgeColor: Color(0xFFD9D9D9),
            ),
            child: InkWell(
              onTap: () {
                const snackBar = SnackBar(
                  content: Text('Cart? button with badge count: $badgeCount'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(
                  'assets/icons/unknown.svg',
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: () {
              const snackBar = SnackBar(
                content: Text('Star button'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: SizedBox(
              height: 28,
              width: 28,
              child: SvgPicture.asset(
                'assets/icons/star_1.svg',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
