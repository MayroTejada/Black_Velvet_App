import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuotationsPage extends StatefulWidget {
  const QuotationsPage({super.key});

  @override
  State<QuotationsPage> createState() => _QuotationsPageState();
}

class _QuotationsPageState extends State<QuotationsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('quotation'),
    );
  }
}
