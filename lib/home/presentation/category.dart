import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/common_button.dart';
import 'package:xtendly_test/core/size_operations.dart';
import 'package:xtendly_test/home/domain/category.dart';
import 'package:xtendly_test/home/domain/item.dart';
import 'package:xtendly_test/home/shared/provider.dart';

class CategorySection extends ConsumerWidget {
  const CategorySection({
    super.key,
  });

  // Sizes from figma
  static const refSectionSizeL = Size(1440, 1000);
  static const refSectionSizeS = Size(375, 1096);

  static const refBoxSizeL = Size(410, 600);
  static const refBoxSizeS = Size(204.71, 300);
  static const refButtonSizeL = Size(198.78, 51.98);
  static const refButtonSizeS = Size(127.66, 25.99);

//calculated sizes
  static final Size boxSizeL = divideSize(refBoxSizeL, refSectionSizeL);
  static final Size boxSizeS = divideSize(refBoxSizeS, refSectionSizeS);
  static final Size buttonSizeL = divideSize(refButtonSizeL, refBoxSizeL);
  static final Size buttonSizeS = divideSize(refButtonSizeS, refBoxSizeS);

  static final categoriesInManualOrder = [
    const Category(name: 'Sweatshirts'),
    const Category(name: 'Hoodies'),
    const Category(name: 'Pair'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(itemsNotifierProvider);
    return state.maybeMap(
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
      loadSuccess: (state) {
        final Map<Category, List<Item>> categoryItem = {};
        for (final item in state.items) {
          if (item.categories != null && item.categories!.isNotEmpty) {
            for (final category in item.categories!) {
              categoryItem[category] == null
                  ? categoryItem[category] = [item]
                  : categoryItem[category]!.add(item);
            }
          }
        }

        return ColoredBox(
          color: const Color(0xFFEBEAE8),
          child: AspectRatio(
            aspectRatio: desktopOrMobileSize(
              context,
              refSectionSizeL.aspectRatio,
              refSectionSizeS.aspectRatio,
            ) as double,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final currentScreenSize = constraints.biggest;
                final categoryBoxSize = desktopOrMobileSize(
                  context,
                  multiplySize(currentScreenSize, boxSizeL),
                  multiplySize(currentScreenSize, boxSizeS),
                ) as Size;

                final Size buttonSize =
                    multiplySize(categoryBoxSize, buttonSizeL);
                final Size buttonSizeMobile =
                    multiplySize(categoryBoxSize, buttonSizeS);
                final textSize = buttonSize.height * 24 / refButtonSizeL.height;
                final textSizeMobile =
                    buttonSizeMobile.height * 16 / refButtonSizeS.height;
                return Column(
                  children: [
                    ResponsiveRowColumn(
                      rowSpacing: 40,
                      rowMainAxisAlignment: MainAxisAlignment.center,
                      rowPadding: const EdgeInsets.only(top: 116, bottom: 60),
                      columnPadding: const EdgeInsets.only(
                        top: 53,
                      ),
                      columnSpacing: 32,
                      layout: desktopOrMobileSize(
                        context,
                        ResponsiveRowColumnType.ROW,
                        ResponsiveRowColumnType.COLUMN,
                      ) as ResponsiveRowColumnType,
                      children: [
                        for (final category in categoriesInManualOrder)
                          ResponsiveRowColumnItem(
                            child: InkWell(
                              onTap: () {
                                final snackBar = SnackBar(
                                  content: Text(category.name),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 10,
                                          offset: const Offset(4, 4),
                                        )
                                      ],
                                      image: DecorationImage(
                                        image: AssetImage(
                                          categoryItem[category]![0].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    width: categoryBoxSize.width,
                                    height: categoryBoxSize.height,
                                  ),
                                  Positioned(
                                    top: categoryBoxSize.height * 0.85,
                                    child: CommonButton(
                                      text: category.name,
                                      size: buttonSize,
                                      sizeMobile: buttonSizeMobile,
                                      fontSize: desktopOrMobileSize(
                                        context,
                                        textSize,
                                        textSizeMobile,
                                      ) as double,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    const ResponsiveVisibility(
                      hiddenWhen: [Condition.smallerThan(name: DESKTOP)],
                      child: Flexible(
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.fitHeight,
                          child: Text(
                            '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco
laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.''',
                            textAlign: TextAlign.center,
                            // overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
