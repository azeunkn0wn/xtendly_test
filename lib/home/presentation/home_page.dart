import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/app_bar.dart';
import 'package:xtendly_test/core/presentation/footer/footer.dart';
import 'package:xtendly_test/core/presentation/top_text_button.dart';
import 'package:xtendly_test/core/presentation/widget_constants.dart';
import 'package:xtendly_test/core/size_operations.dart';
import 'package:xtendly_test/home/presentation/category.dart';
import 'package:xtendly_test/home/presentation/header.dart';
import 'package:xtendly_test/home/presentation/sale_item_section.dart';
import 'package:xtendly_test/home/shared/provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StateTestState();
}

class _StateTestState extends ConsumerState<HomePage> {
  late final ScrollController _controller;

  @override
  void initState() {
    Future.microtask(
      () => ref.read(itemsNotifierProvider.notifier).loadItems(),
    );
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse &&
        _appBarIsOpaque == 1) {
      setState(() {
        _appBarIsOpaque = 0;
      });
    }
    if (_controller.position.userScrollDirection == ScrollDirection.forward &&
        _appBarIsOpaque != 1) {
      setState(() {
        _appBarIsVisible = true;
        _appBarIsOpaque = 1;
      });
    }
  }

  bool _appBarIsVisible = true;
  double _appBarIsOpaque = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              controller: _controller,
              children: const [
                HeaderWidget(),
                CategorySection(),
                SaleItems(),
                Footer(),
              ],
            ),
            const ResponsiveVisibility(
              hiddenWhen: [
                Condition.smallerThan(name: TABLET),
              ],
              child: TopTextButtons(),
            ),
            Positioned(
              top: desktopOrMobileSize(context, topSpacing, topSpacingMobile)
                  as double?,
              left: 0,
              right: 0,
              child: Visibility(
                visible: _appBarIsVisible,
                maintainAnimation: true,
                maintainState: true,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _appBarIsOpaque,
                  onEnd: () {
                    setState(() {
                      _appBarIsVisible = _appBarIsOpaque > 0.0;
                    });
                  },
                  curve: Curves.linearToEaseOut,
                  child: const ResponsiveAppBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        HeaderWidget(),
        CategorySection(),
        SaleItems(),
        Footer(),
      ],
    );
  }
}
