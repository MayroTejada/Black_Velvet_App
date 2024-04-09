import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:pocketbase/pocketbase.dart';

class AuthGuard extends AutoRouteGuard {
  final PocketBase pocketBase;
  AuthGuard({required this.pocketBase});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (pocketBase.authStore.isValid) {
      resolver.next(true);
    } else {
      router.replace(const LoginRoute());
    }
  }
}
