import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/core/components/form_container_velvet.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CakeQuotationPage extends StatefulWidget {
  const CakeQuotationPage({super.key});

  @override
  State<CakeQuotationPage> createState() => _CakeQuotationPageState();
}

class _CakeQuotationPageState extends State<CakeQuotationPage> {
  late TextEditingController _nameTextEditingController;
  late ScrollController _scrollBarcontroller;
  late Size screenSize = MediaQuery.of(context).size;
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
                    maxSize:
                        Size(screenSize.width * .6, screenSize.height * .9),
                    child: Form(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 500,
                              child: AutoTabsRouter(
                                  homeIndex: 0,
                                  routes: [CakeQuoteUserFormRoute()]),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                FilledButton(
                                    onPressed: () => {},
                                    child: const Text('siguiente')),
                              ],
                            )
                          ],
                        ),
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
