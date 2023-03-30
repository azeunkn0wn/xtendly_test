import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/app_bar.dart';
import 'package:xtendly_test/core/presentation/footer/footer.dart';
import 'package:xtendly_test/core/presentation/top_text_button.dart';
import 'package:xtendly_test/home/application/items_notifier.dart';
import 'package:xtendly_test/home/presentation/header.dart';
import 'package:xtendly_test/home/shared/provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StateTestState();
}

class _StateTestState extends ConsumerState<HomePage> {
  @override
  void initState() {
    Future.microtask(
      () => ref.read(itemsNotifierProvider.notifier).loadItems(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemsNotifierProvider);
    return Scaffold(
      body: Stack(
        children: [
          BodyContent(state: state),
          const ResponsiveVisibility(
            hiddenWhen: [
              Condition.smallerThan(name: MOBILE),
            ],
            child: TopTextButtons(),
          ),
          const ResponsiveNavBar(),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderWidget(),
          const Footer(),
          ItemsGrid(state: state),
        ],
      ),
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
              title: Text(item!.name),
              subtitle: Text(item.image),
            );
          },
        ),
      ),
    );
  }
}
