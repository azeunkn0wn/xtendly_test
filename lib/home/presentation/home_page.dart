import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/app_bar.dart';
import 'package:xtendly_test/core/presentation/footer/footer.dart';
import 'package:xtendly_test/core/presentation/top_text_button.dart';
import 'package:xtendly_test/core/presentation/widget_constants.dart';
import 'package:xtendly_test/home/application/items_notifier.dart';
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
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      setState(() {
        _appBarIsOpaque = 0;
      });
    }
    if (_controller.position.userScrollDirection == ScrollDirection.forward) {
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
    final state = ref.watch(itemsNotifierProvider);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,
            child: BodyContent(state: state),
          ),
          const ResponsiveVisibility(
            hiddenWhen: [
              Condition.smallerThan(name: TABLET),
            ],
            child: TopTextButtons(),
          ),
          Positioned(
            top: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                ? topSpacingMobile
                : topSpacing,
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
                child: ResponsiveAppBar(
                  height: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                      ? appBarHeightMobile
                      : appBarHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BodyContent extends StatelessWidget {
  const BodyContent({
    super.key,
    required this.state,
  });

  final ItemsState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(),
        CategorySection(state: state),
        SaleItems(state: state),
        // ItemsGrid(state: state),
        const Footer(),
      ],
    );
  }
}

class ItemsGrid extends StatelessWidget {
  const ItemsGrid({
    super.key,
    required this.state,
  });

  final ItemsState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: state.maybeMap(
        orElse: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loadSuccess: (state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state.items.length,
          itemBuilder: (context, index) {
            final item = state.items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.image),
            );
          },
        ),
      ),
    );
  }
}
