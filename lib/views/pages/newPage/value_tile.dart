import 'package:flutter/material.dart';
import 'package:tshitenge/main.dart';
import 'themes.dart';
import 'empty_widget.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;

  ValueTile(this.label, this.value, {required this.iconData});

  @override
  Widget build(BuildContext context) {
    ThemeData appTheme = Themes.getTheme();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          this.label,
          style: TextStyle(color: appTheme.accentColor.withAlpha(80)),
        ),
        SizedBox(
          height: 5,
        ),
        this.iconData != null
            ? Icon(
                iconData,
                color: appTheme.accentColor,
                size: 20,
              )
            : EmptyWidget(),
        SizedBox(
          height: 10,
        ),
        Text(
          this.value,
          style: TextStyle(color: appTheme.accentColor),
        ),
      ],
    );
  }
}
