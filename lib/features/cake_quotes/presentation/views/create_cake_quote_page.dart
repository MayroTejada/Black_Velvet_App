import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/core/components/form_container_velvet.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreateCakeQuotePage extends StatefulWidget {
  const CreateCakeQuotePage({super.key});

  @override
  State<CreateCakeQuotePage> createState() => _CreateCakeQuotePageState();
}

class _CreateCakeQuotePageState extends State<CreateCakeQuotePage> {
  late TextEditingController _nameTextEditingController;
  late ScrollController _scrollBarcontroller;
  @override
  void initState() {
    _scrollBarcontroller = ScrollController();
    _nameTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollBarcontroller,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: FormContainerVelvet(
                    title: 'Cotiza Tu pastel',
                    size: Size(MediaQuery.of(context).size.width * .8, 600),
                    child: Form(
                      child: Column(
                        children: [
                          TextField(
                            decoration:
                                const InputDecoration(hintText: "Nombre"),
                            onSubmitted: (value) {},
                            style: const TextStyle(),
                            controller: _nameTextEditingController,
                          ),
                        ],
                      ),
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
