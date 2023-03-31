import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/common_button.dart';
import 'package:xtendly_test/core/size_operations.dart';
import 'package:xtendly_test/home/application/items_notifier.dart';
import 'package:xtendly_test/home/domain/category.dart';
import 'package:xtendly_test/home/domain/item.dart';

class CategorySection extends StatelessWidget {
  final ItemsState state;
  const CategorySection({
    super.key,
    required this.state,
  });

  // Size references from figma
  static const sectionSizeL = Size(1440, 1000);
  static const sectionSizeS = Size(375, 1096);

  static const boxSizeL = Size(410, 600);
  static const boxSizeS = Size(204.71, 300);
  static const buttonSizeL = Size(198.78, 51.98);
  static const buttonSizeS = Size(127.66, 25.99);

  static final categoriesInManualOrder = [
    const Category(name: 'Sweatshirts'),
    const Category(name: 'Hoodies'),
    const Category(name: 'Pair'),
  ];

  @override
  Widget build(BuildContext context) {
    final isBigScreen = ResponsiveWrapper.of(context).isLargerThan(TABLET);

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

        return AspectRatio(
          aspectRatio:
              isBigScreen ? sectionSizeL.aspectRatio : sectionSizeS.aspectRatio,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final currentScreenSize = constraints.biggest;
              final categoryBoxSize = isBigScreen
                  ? scaleByReference(currentScreenSize, boxSizeL, sectionSizeL)
                  : scaleByReference(currentScreenSize, boxSizeS, sectionSizeS);

              final buttonSize = isBigScreen
                  ? scaleByReference(categoryBoxSize, buttonSizeL, boxSizeL)
                  : scaleByReference(categoryBoxSize, buttonSizeS, boxSizeS);

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
                    layout: ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)
                        ? ResponsiveRowColumnType.COLUMN
                        : ResponsiveRowColumnType.ROW,
                    children: [
                      for (final category in categoriesInManualOrder)
                        ResponsiveRowColumnItem(
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
                                  height: buttonSize.height,
                                  width: buttonSize.width,
                                  fontSize: isBigScreen
                                      ? categoryBoxSize.height *
                                          (24 / boxSizeL.height)
                                      : categoryBoxSize.height *
                                          (15 / boxSizeS.height),
                                ),
                              ),
                            ],
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
deserunt mollit anim id est laborum.
                        ''',
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
        );
      },
    );
  }
}
