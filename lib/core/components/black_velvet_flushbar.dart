import 'package:another_flushbar/flushbar.dart';
import 'package:black_velvet_app/core/theme/colors.dart';
import 'package:flutter/material.dart';

Future<void> showVelvetFlushbar({
  required BuildContext context,
  Color? color,
  Duration? duration,
  String? title,
  String? message,
}) {
  return Flushbar(
    duration: duration ?? const Duration(seconds: 2),
    backgroundColor: color ?? redVelvet,
    title: title,
    message: message,
  ).show(context);
}
