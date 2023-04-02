import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:xtendly_test/core/presentation/common_button.dart';
import 'package:xtendly_test/core/size_operations.dart';

import 'package:xtendly_test/home/shared/provider.dart';

const saleText =
    'SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      SALE      ';

class SaleItems extends StatelessWidget {
  const SaleItems({
    super.key,
  });
  static const bool useScrollingText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (useScrollingText)
          const SaleBannerScrollingText()
        else
          const SaleBanner(),
        SizedBox(
          height: desktopOrMobileSize(context, 79, 54) as double,
        ),
        const ItemsGrid(),
        CommonButton(
          text: 'More',
          size: const Size(218, 57),
          sizeMobile: const Size(124, 32),
          fontSize: desktopOrMobileSize(context, 24.0, 18.0) as double,
        ),
        SizedBox(
          height: desktopOrMobileSize(context, 65, 72) as double,
        ),
      ],
    );
  }
}

/// Static SALE banner
class SaleBanner extends StatelessWidget {
  const SaleBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveValue<double>(
          context,
          defaultValue: 75.0,
          valueWhen: [
            const Condition.largerThan(
              name: TABLET,
              value: 75.0,
            ),
            const Condition.smallerThan(
              name: TABLET,
              value: 140.0,
            )
          ],
        ).value!,
      ),
      height: ResponsiveValue<double>(
        context,
        defaultValue: 77.0,
        valueWhen: const [
          Condition.largerThan(
            name: TABLET,
            value: 77.0,
          ),
          Condition.smallerThan(
            name: TABLET,
            value: 46.0,
          )
        ],
      ).value,
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
              saleText,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                color: const Color(0xFFCF4242),
                fontSize: ResponsiveValue<double>(
                  context,
                  defaultValue: 50,
                  valueWhen: const [
                    Condition.largerThan(
                      name: TABLET,
                      value: 50,
                    ),
                    Condition.smallerThan(
                      name: TABLET,
                      value: 35.0,
                    )
                  ],
                ).value,
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveValue<double>(
        context,
        defaultValue: 77.0,
        valueWhen: const [
          Condition.largerThan(
            name: TABLET,
            value: 77.0,
          ),
          Condition.smallerThan(
            name: TABLET,
            value: 46.0,
          ),
        ],
      ).value,
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
              child: TextScroll(
                saleText,
                velocity: const Velocity(pixelsPerSecond: Offset(50, 0)),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFCF4242),
                  fontSize: ResponsiveValue<double>(
                    context,
                    defaultValue: 50,
                    valueWhen: const [
                      Condition.largerThan(name: TABLET, value: 50),
                      Condition.smallerThan(name: TABLET, value: 35),
                    ],
                  ).value,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemsGrid extends ConsumerWidget {
  const ItemsGrid({
    super.key,
  });

  // Sizes from Figma
  static const refSectionSize = Size(1440, 1303);
  static const refSectionSizeMobile = Size(375, 1000);

  static const refItemBoxSize = Size(272.95, 400);
  static const refItemBoxSizeMobile = Size(141, 200);
  static const refDiscountTagSize = Size(91, 40);
  static const refDiscountTagSizeMobile = Size(48, 23);
  static const discountTagPosition = Offset(222, 17);
  static const discountTagPositionMobile = Offset(114, 8);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsNotifierProvider);
    return state.maybeMap(
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
      loadSuccess: (state) {
        const maxItemCount = 8;
        return ResponsiveGridView.builder(
          alignment: Alignment.center,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.items.length > maxItemCount
              ? maxItemCount
              : state.items.length,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
          shrinkWrap: true,
          gridDelegate: ResponsiveGridDelegate(
            crossAxisSpacing: desktopOrMobileSize(context, 27, 5) as double,
            mainAxisSpacing: desktopOrMobileSize(context, 40, 24) as double,
            crossAxisExtent: desktopOrMobileSize(context, 313, 162) as double,
            childAspectRatio:
                desktopOrMobileSize(context, 313 / 464, 162 / 249) as double,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                final snackBar = SnackBar(
                  content: Text('item #$index'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: SizedBox(
                height: 505,
                width: 340,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: ResponsiveValue<double>(
                            context,
                            defaultValue: 400,
                            valueWhen: const [
                              Condition.largerThan(name: TABLET, value: 400),
                              Condition.smallerThan(name: TABLET, value: 200),
                            ],
                          ).value,
                          width: ResponsiveValue<double>(
                            context,
                            defaultValue: 272.95,
                            valueWhen: const [
                              Condition.largerThan(name: TABLET, value: 272.95),
                              Condition.smallerThan(name: TABLET, value: 141),
                            ],
                          ).value,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(state.items[index].image),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            state.items[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: ResponsiveValue<double>(
                                context,
                                defaultValue: 18,
                                valueWhen: [
                                  const Condition.largerThan(
                                    name: TABLET,
                                    value: 18,
                                  ),
                                  const Condition.smallerThan(
                                    name: TABLET,
                                    value: 15,
                                  ),
                                ],
                              ).value,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            state.items[index].description,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: ResponsiveValue<double>(
                                context,
                                defaultValue: 18,
                                valueWhen: [
                                  const Condition.largerThan(
                                    name: TABLET,
                                    value: 18,
                                  ),
                                  const Condition.smallerThan(
                                    name: TABLET,
                                    value: 13,
                                  ),
                                ],
                              ).value,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: state.items[index].discount != null &&
                          state.items[index].discount! > 0,
                      child: Positioned(
                        left: desktopOrMobileScreenSize(
                          context,
                          discountTagPosition.dx,
                          discountTagPositionMobile.dx,
                        ) as double,
                        top: desktopOrMobileScreenSize(
                          context,
                          discountTagPosition.dy,
                          discountTagPositionMobile.dy,
                        ) as double,
                        height: desktopOrMobileScreenSize(
                          context,
                          refDiscountTagSize.height,
                          refDiscountTagSizeMobile.height,
                        ) as double,
                        width: desktopOrMobileScreenSize(
                          context,
                          refDiscountTagSize.width,
                          refDiscountTagSizeMobile.width,
                        ) as double,
                        child: Container(
                          alignment: Alignment.center,
                          color: const Color(0xFFE0CA9E),
                          child: Text(
                            '${state.items[index].discount! * 100}% OFF',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize:
                                  desktopOrMobileScreenSize(context, 18, 10)
                                      as double,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
