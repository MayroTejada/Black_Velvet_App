import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int selectedIndex = 0;

  Widget setView(int index) {
    switch (index) {
      case 0:
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
    return AutoTabsRouter(
        routes: const [QuotationsRoute(), ProfileRoute()],
        transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              // the passed child is technically our animated selected-tab page
              child: child,
            ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: Row(
              children: [
                SideNavigationBar(
                  theme: SideNavigationBarTheme(
                      backgroundColor: Colors.black,
                      itemTheme: SideNavigationBarItemTheme(
                          selectedItemColor: Colors.pink),
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
                    tabsRouter.setActiveIndex(index);
                  },
                ),
                Expanded(child: Scrollbar(child: child)),
              ],
            ),
          );
        });
  }
}
