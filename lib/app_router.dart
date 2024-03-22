import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/core/routing/auth_guard.dart';
import 'package:black_velvet_app/features/cake_quotes/presentation/views/create_cake_quote_page.dart';
import 'package:black_velvet_app/features/home/presentation/views/home_page.dart';
import 'package:black_velvet_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:black_velvet_app/features/login/presentation/views/login.dart';
import 'package:black_velvet_app/injection_container.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cu
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            path: '/login',
            page: LoginRoute.page,
            initial: true,
            guards: const []),
        AutoRoute(
            path: '/home',
            page: HomeRoute.page,
            guards: [AuthGuard(authBloc: getIt<AuthBloc>())]),
        AutoRoute(
            path: '/new-cake-quote',
            page: CreateCakeQuoteRoute.page,
            guards: const []),
      ];
}
