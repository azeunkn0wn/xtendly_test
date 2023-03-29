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

  @override
  Widget build(BuildContext context) {
    const double dividerPadding = 3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
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
              badgeContent: const Text(
                '0',
                style: TextStyle(fontSize: 7),
              ),
              position: badges.BadgePosition.bottomEnd(bottom: -5, end: -5),
              badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(4),
                badgeColor: Color(0xFFD9D9D9),
              ),
              child: InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: SvgPicture.asset(
                    'icons/unknown.svg',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(
                  'icons/star_1.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
