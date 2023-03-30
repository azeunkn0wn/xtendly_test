import 'package:flutter/material.dart';

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
    return Container(
      height: 1024,
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
              Positioned(
                top: height * 0.249,
                left: 0,
                width: width * 0.264,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/3.png'),
                ),
              ),
              Positioned(
                top: 215,
                right: 0,
                width: width * 0.502,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/4.png'),
                ),
              ),
              Positioned(
                top: height * 0.282,
                left: width * 0.246,
                width: width * 0.264,
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
    );
  }
}
