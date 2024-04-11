import 'package:flutter/material.dart';

class VelvetElevatedButton extends StatelessWidget {
  final Function()? onPressedCallback;
  final String text;
  final bool isLoading;
  const VelvetElevatedButton(
      {super.key,
      required this.onPressedCallback,
      required this.text,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(enableFeedback: !isLoading),
      onPressed: !isLoading ? onPressedCallback : null,
      child: !isLoading
          ? Text(text)
          : const SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(),
            ),
    );
  }
}
