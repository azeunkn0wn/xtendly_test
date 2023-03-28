import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromRadius(25),
      child: CircleAvatar(
        backgroundColor: const Color(0xFFD9D9D9),
        child: Text(
          'LOGO',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
