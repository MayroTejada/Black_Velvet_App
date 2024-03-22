import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  Widget setView(int index) {
    switch (index) {
      case 0:
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Placeholder(
            child: Text('cotizaciones'),
          ),
        );
      case 1:
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const Placeholder(
            child: Text('Cuenta'),
          ),
        );
      default:
        return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavigationBar(
            theme: SideNavigationBarTheme(
                backgroundColor: Colors.black,
                itemTheme:
                    SideNavigationBarItemTheme(selectedItemColor: Colors.pink),
                togglerTheme: const SideNavigationBarTogglerTheme(),
                dividerTheme: const SideNavigationBarDividerTheme(
                    showHeaderDivider: true,
                    showMainDivider: true,
                    showFooterDivider: true)),
            selectedIndex: selectedIndex,
            items: const [
              SideNavigationBarItem(
                icon: Icons.receipt,
                label: 'Cotizaciones',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Account',
              ),
              SideNavigationBarItem(
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Scrollbar(
                child: SingleChildScrollView(child: setView(selectedIndex))),
          )
        ],
      ),
    );
  }
}
