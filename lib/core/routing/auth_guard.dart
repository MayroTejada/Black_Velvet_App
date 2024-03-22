import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/features/login/presentation/bloc/auth_bloc.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthBloc authBloc;

  AuthGuard({required this.authBloc});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authBloc.state is AuthSuccess) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
