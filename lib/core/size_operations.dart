import 'dart:ui';

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

/// scale size using reference sizes from figma design or the like
Size scaleByReference(Size parentSize, Size refWidgetSize, Size refParentSize) {
  return multiplySize(
    parentSize,
    divideSize(
      refWidgetSize,
      refParentSize,
    ),
  );
}
