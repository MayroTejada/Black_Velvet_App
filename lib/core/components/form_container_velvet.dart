import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class FormContainerVelvet extends StatelessWidget {
  final Form child;
  final double padding;
  final Size maxSize;
  final String title;
  const FormContainerVelvet(
      {super.key,
      required this.maxSize,
      required this.child,
      this.padding = 15,
      this.title = ''});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: maxSize.height, maxWidth: maxSize.width),
        child: Material(
          elevation: 2,
          color: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ResponsiveRowColumn(
            layout: ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                  child: Text(
                title,
                style: const TextStyle(fontSize: 23),
              )),
              ResponsiveRowColumnItem(child: child),
            ],
          ),
        ));
  }
}
