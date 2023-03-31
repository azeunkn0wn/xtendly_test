import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:xtendly_test/home/application/items_notifier.dart';

class SaleItems extends StatelessWidget {
  final ItemsState state;
  const SaleItems({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final isBigScreen = ResponsiveWrapper.of(context).isLargerThan(TABLET);

    return SizedBox(
      height: 1300,
      child: Column(
        children: [
          SaleBanner(isBigScreen: isBigScreen),
        ],
      ),
    );
  }
}

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
