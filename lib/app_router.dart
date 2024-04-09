import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:black_velvet_app/core/routing/auth_guard.dart';
import 'package:black_velvet_app/features/auth/presentation/views/login_page.dart';
import 'package:black_velvet_app/features/auth/presentation/views/splash.dart';
import 'package:black_velvet_app/features/cake_quotes/presentation/pages/cake_quote_user_form.dart';
import 'package:black_velvet_app/features/cake_quotes/presentation/views/cake_quotation_page.dart';
import 'package:black_velvet_app/features/dashboard/presentation/views/dashboard_page.dart';
import 'package:black_velvet_app/features/dashboard/presentation/views/quotations_page.dart';
import 'package:black_velvet_app/features/profile/presentation/views/profile_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material(); //.cu
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          path: '/splash',
          initial: true,
        ),
        AutoRoute(path: '/login', page: LoginRoute.page, guards: const []),
        AutoRoute(path: '/dashboard', page: DashboardRoute.page, children: [
          AutoRoute(
              page: QuotationsRoute.page, path: 'quotations', initial: true),
          AutoRoute(page: ProfileRoute.page, path: 'profile')
        ], guards: [
          AuthGuard(pocketBase: pb)
        ]),
        AutoRoute(path: '/new-quote', page: CakeQuotationRoute.page, children: [
          AutoRoute(page: CakeQuoteUserFormRoute.page, path: 'quotations')
        ], guards: const []),
      ];
}
