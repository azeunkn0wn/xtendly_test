import 'package:flutter/material.dart';

import 'package:xtendly_test/core/presentation/common_button.dart';

import 'package:xtendly_test/core/size_operations.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  // figma design sizes
  static const headerSectionSize = Size(1440, 1024);
  static const headerSectionSizeMobile = Size(375, 812);

  final box1Size = divideSize(const Size(381, 514), headerSectionSize);
  final box1SizeMobile =
      divideSize(const Size(187, 263), headerSectionSizeMobile);
  final box1Image = 'assets/images/3.png';

  final box2Size = divideSize(const Size(724, 532), headerSectionSize);
  final box2SizeMobile =
      divideSize(const Size(267, 197), headerSectionSizeMobile);
  final box2Image = 'assets/images/4.png';

  final box3Size = divideSize(const Size(387, 564), headerSectionSize);
  final box3SizeMobile =
      divideSize(const Size(197, 294), headerSectionSizeMobile);
  final box3Image = 'assets/images/2.png';

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: desktopOrMobileSize(
        context,
        headerSectionSize.width / headerSectionSize.height,
        headerSectionSizeMobile.width / headerSectionSizeMobile.height,
      ) as double,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/5.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final height = constraints.maxHeight;
            final width = constraints.maxWidth;
            return Stack(
              alignment: Alignment.center,
              children: [
                AnimatedPositioned(
                  curve: Curves.easeInOutQuart,
                  duration: const Duration(milliseconds: 500),
                  top: desktopOrMobileSize(
                    context,
                    height * 0.249,
                    height * 0.612,
                  ) as double,
                  left: desktopOrMobileSize(context, 0.0, width * 0.464)
                      as double,
                  width: desktopOrMobileSize(
                    context,
                    width * box1Size.width,
                    width * box1SizeMobile.width,
                  ) as double?,
                  height: desktopOrMobileSize(
                    context,
                    height * box1Size.height,
                    height * box1SizeMobile.height,
                  ) as double?,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(box1Image),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOutQuart,
                  duration: const Duration(milliseconds: 500),
                  top: desktopOrMobileSize(
                    context,
                    height * 0.210,
                    height * 0.138,
                  ) as double,
                  right: 0.0,
                  width: desktopOrMobileSize(
                    context,
                    width * box2Size.width,
                    width * box2SizeMobile.width,
                  ) as double?,
                  height: desktopOrMobileSize(
                    context,
                    height * box2Size.height,
                    height * box2SizeMobile.height,
                  ) as double?,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(box2Image),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOutQuart,
                  duration: const Duration(milliseconds: 500),
                  top: desktopOrMobileSize(
                    context,
                    height * 0.300,
                    height * 0.362,
                  ) as double,
                  left: desktopOrMobileSize(
                    context,
                    width * 0.246,
                    width * 0.05,
                  ) as double,
                  width: desktopOrMobileSize(
                    context,
                    width * box3Size.width,
                    width * box3SizeMobile.width,
                  ) as double?,
                  height: desktopOrMobileSize(
                    context,
                    height * box3Size.height,
                    height * box3SizeMobile.height,
                  ) as double?,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(box3Image),
                  ),
                ),
                Positioned(
                  top: desktopOrMobileSize(
                    context,
                    height * 0.786,
                    height * 0.5,
                  ) as double,
                  height: desktopOrMobileSize(context, 57.0, 47.0) as double,
                  width: desktopOrMobileSize(context, 218.0, 180.0) as double,
                  child: CommonButton(
                    text: 'Shop Now',
                    fontSize:
                        desktopOrMobileSize(context, 24.0, 20.0) as double,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
