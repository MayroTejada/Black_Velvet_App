import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateCakeQuotePage extends StatefulWidget {
  const CreateCakeQuotePage({super.key});

  @override
  State<CreateCakeQuotePage> createState() => _CreateCakeQuotePageState();
}

class _CreateCakeQuotePageState extends State<CreateCakeQuotePage> {
  late TextEditingController _nameTextEditingController;
  @override
  void initState() {
    _nameTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Cotiza tu Pastel :D',
                style: TextStyle(fontSize: 26),
              ),
              Center(
                child: SizedBox(
                  width: 500,
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          decoration: const InputDecoration(hintText: "Nombre"),
                          onSubmitted: (value) {},
                          style: const TextStyle(),
                          controller: _nameTextEditingController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
