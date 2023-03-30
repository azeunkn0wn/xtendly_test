import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Size size;
  const Logo({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        const snackBar = SnackBar(
          content: Text('Logo'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: SizedBox.fromSize(
        size: size,
        child: CircleAvatar(
          backgroundColor: const Color(0xFFD9D9D9),
          child: Text(
            'LOGO',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: size.height * 0.2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
