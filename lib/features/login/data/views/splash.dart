import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:black_velvet_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>()..add(CheckAuthEvent()),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStateEnum == AuthStateEnum.success) {
            context.router.replace(const DashboardRoute());
          }
          if (state.authStateEnum == AuthStateEnum.failure) {
            context.router.replace(const LoginRoute());
          }
        },
        child: Scaffold(
          body: Center(
            child: Lottie.asset('assets/cake_loader_animation.json'),
          ),
        ),
      ),
    );
  }
}
