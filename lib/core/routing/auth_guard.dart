import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/features/auth/presentation/bloc/auth_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authBloc.state.authStateEnum == AuthStateEnum.success) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
