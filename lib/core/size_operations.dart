import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

Size multiplySize(Size size1, Size size2) {
  final width = size1.width * size2.width;
  final height = size1.height * size2.height;

  return Size(width, height);
}

Size divideSize(Size size1, Size size2) {
  final width = size1.width / size2.width;
  final height = size1.height / size2.height;

  return Size(width, height);
}

/// shortcut for ResponsiveValue
dynamic desktopOrMobileSize(
  BuildContext context,
  dynamic desktopSize,
  dynamic mobileSize,
) {
  return ResponsiveValue<dynamic>(
    context,
    defaultValue: desktopSize,
    valueWhen: [
      Condition.largerThan(name: TABLET, value: desktopSize),
      Condition.equals(name: TABLET, value: desktopSize),
      Condition.smallerThan(name: TABLET, value: mobileSize),
    ],
  ).value;
}
