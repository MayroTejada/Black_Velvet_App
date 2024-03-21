import 'package:black_velvet_app/core/constants/routes_locations.dart';
import 'package:black_velvet_app/features/home/presentation/views/home_page.dart';
import 'package:black_velvet_app/features/login/presentation/views/login.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(  
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: homePath,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
