import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:xtendly_test/core/presentation/app_bar/logo.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF6E6E6E);
    const backgroundColor = Color(0xFFEBEAE8);

    return ColoredBox(
      color: backgroundColor,
      child: ResponsiveRowColumn(
        columnCrossAxisAlignment: CrossAxisAlignment.start,
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        layout: ResponsiveWrapper.of(context).isLargerThan(TABLET)
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        rowPadding: const EdgeInsets.only(top: 37, left: 88, right: 80),
        columnPadding:
            const EdgeInsets.only(top: 64, left: 25, right: 25, bottom: 100),
        children: [
          const ResponsiveRowColumnItem(
            rowFlex: 5,
            child: ContactDetails(
              color: color,
              backgroundColor: backgroundColor,
            ),
          ),
          ...generateLinksWidgets(context),
        ],
      ),
    );
  }

  List<ResponsiveRowColumnItem> generateLinksWidgets(BuildContext context) {
    final links = {
      'COLLECTION': [
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
      ],
      'INFORMATION': [
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
      ],
      'MORE': [
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
        'Lorem ipsum',
      ],
    };
    return links.entries.map((map) {
      final title = map.key;

      final linkItems = map.value
          .map(
            (name) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
          .toList();

      return ResponsiveRowColumnItem(
        rowFlex: 2,
        child: Container(
          padding: ResponsiveWrapper.of(context).isLargerThan(TABLET)
              ? null
              : const EdgeInsets.only(left: 20),
          alignment: ResponsiveWrapper.of(context).isLargerThan(TABLET)
              ? Alignment.center
              : Alignment.centerLeft,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: ResponsiveWrapper.of(context).isLargerThan(TABLET)
                        ? 21.0
                        : 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...ResponsiveWrapper.of(context).isLargerThan(TABLET)
                  ? linkItems
                  : [],
            ],
          ),
        ),
      );
    }).toList();
  }
}

class ContactDetails extends StatelessWidget {
  const ContactDetails({
    super.key,
    required this.color,
    required this.backgroundColor,
  });

  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final double dimension = ResponsiveValue(
      context,
      defaultValue: 130,
      valueWhen: [
        const Condition.largerThan(name: DESKTOP, value: 130),
        const Condition.smallerThan(name: DESKTOP, value: 100),
      ],
    ).value! as double;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Logo(size: Size.square(dimension)),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(MdiIcons.navigationVariant, color: color),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          color: color,
                          fontSize: 15,
                          overflow: TextOverflow.clip,
                        ),
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(MdiIcons.cellphone, color: color),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Text(
                        'Lorem ipsum',
                        style: TextStyle(color: color, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Icon(MdiIcons.emailOutline, color: color),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Text(
                        'Lorem ipsum dolor sit amet',
                        style: TextStyle(color: color, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 15, bottom: 60),
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //
              CircleAvatar(
                backgroundColor: color,
                child: Icon(MdiIcons.facebook, color: backgroundColor),
              ),
              CircleAvatar(
                backgroundColor: color,
                child: Icon(MdiIcons.pinterest, color: backgroundColor),
              ),
              CircleAvatar(
                backgroundColor: color,
                child: Icon(MdiIcons.instagram, color: backgroundColor),
              ),
            ],
          ),
        )
      ],
    );
  }
}