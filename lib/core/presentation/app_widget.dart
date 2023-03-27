import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:xtendly_test/home/presentation/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive App',
      theme: _defaultTheme(),
      builder: (context, child) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, child!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      ),
      home: const HomePage(),
    );
  }

  ThemeData _defaultTheme() {
    const appBarTheme = AppBarTheme(
      color: Color(0xFFFFFFFF),
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      foregroundColor: Color(0xFF000000),
    );
    final elevatedButtonThemeData = ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
        foregroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF000000)),
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      canvasColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFEBEAE8),
      appBarTheme: appBarTheme,
      elevatedButtonTheme: elevatedButtonThemeData,
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}