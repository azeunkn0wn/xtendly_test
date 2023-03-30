import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final isBigScreen = ResponsiveWrapper.of(context).isLargerThan(TABLET);
    return AspectRatio(
      aspectRatio: isBigScreen ? 1440 / 1024 : 375 / 812,
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
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: isBigScreen ? height * 0.249 : height * 0.612,
                  left: isBigScreen ? 0 : width * 0.464,
                  width: isBigScreen ? width * 0.264 : null,
                  height: isBigScreen ? null : height * 0.324,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/3.png'),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: isBigScreen ? height * 0.210 : height * 0.138,
                  right: 0,
                  width: isBigScreen ? width * 0.502 : null,
                  height: isBigScreen ? null : height * 0.243,
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/4.png'),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  top: isBigScreen ? height * 0.300 : height * 0.362,
                  left: isBigScreen ? width * 0.246 : width * 0.05,
                  width: isBigScreen ? width * 0.264 : null,
                  height: isBigScreen ? null : height * 0.362,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/2.png'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
