import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/core/network/pocket_base_client.dart';

class AuthGuard extends AutoRouteGuard {
  final PocketBaseModuleImpl module;
  AuthGuard({required this.module});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (module.pocketBase.authStore.isValid) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
