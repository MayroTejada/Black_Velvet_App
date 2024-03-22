import 'package:flutter/material.dart';

class FormContainerVelvet extends StatelessWidget {
  final Form child;
  final double padding;
  final Size size;
  final String title;
  const FormContainerVelvet(
      {super.key,
      required this.size,
      required this.child,
      this.padding = 15,
      this.title = ''});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height, maxWidth: size.width),
      child: Material(
        elevation: 2,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
