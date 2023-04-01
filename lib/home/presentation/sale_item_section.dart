import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:text_scroll/text_scroll.dart';

import 'package:xtendly_test/home/application/items_notifier.dart';

class SaleItems extends StatelessWidget {
  final ItemsState state;
  const SaleItems({
    super.key,
    required this.state,
  });

  static bool useScrollingText = true;

  @override
  Widget build(BuildContext context) {
    final isBigScreen = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return SizedBox(
      height: 1300,
      child: Column(
        children: [
          if (useScrollingText)
            SaleBannerScrollingText(isBigScreen: isBigScreen)
          else
            SaleBanner(isBigScreen: isBigScreen),
          Container(),
        ],
      ),
    );
  }
}

/// Static SALE banner
class SaleBanner extends StatelessWidget {
  const SaleBanner({
    super.key,
    required this.isBigScreen,
  });

  final bool isBigScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isBigScreen ? 140 : 75),
      height: isBigScreen ? 77 : 46,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: Text(
              'SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      ',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: const Color(0xFFCF4242),
                fontSize: isBigScreen ? 50 : 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Scrolling text animated SALE banner
class SaleBannerScrollingText extends StatelessWidget {
  const SaleBannerScrollingText({
    super.key,
    required this.isBigScreen,
  });

  final bool isBigScreen;

  @override
  Widget build(BuildContext context) {
    const textScroll = TextScroll(
      'SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      ',
      velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFCF4242),
        fontSize: 50,
        fontWeight: FontWeight.w600,
      ),
    );
    const textScrollMobile = TextScroll(
      'SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      ',
      velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xFFCF4242),
        fontSize: 35,
        fontWeight: FontWeight.w600,
      ),
    );
    return Container(
      height: isBigScreen ? 77 : 46,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(4, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Flexible(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: isBigScreen ? textScroll : textScrollMobile,
            ),
          ),
        ],
      ),
    );
  }
}
