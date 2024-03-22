import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/core/components/black_velvet_flushbar.dart';
import 'package:black_velvet_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:black_velvet_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'login_form');
  void initTextFields() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void initState() {
    initTextFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              showVelvetFlushbar(
                      context: context, title: 'success', message: '<3')
                  .then((value) {
                context.router.replace(const DashboardRoute());
              });
            } else if (state is AuthFailed) {
              Flushbar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
                title: 'ERROR!!',
                message: 'X_X',
              ).show(context);
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'inicia sesion:D',
                            style: TextStyle(fontSize: 26),
                          ),
                          Center(
                            child: SizedBox(
                              width: 500,
                              child: Form(
                                key: formKey,
                                autovalidateMode: AutovalidateMode.always,
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Email"),
                                      onSubmitted: (value) {},
                                      style: const TextStyle(),
                                      controller: _emailTextEditingController,
                                    ),
                                    TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Password"),
                                      onSubmitted: (value) {},
                                      style: const TextStyle(),
                                      controller:
                                          _passwordTextEditingController,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          FilledButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(SignInEvent(
                                    email: _emailTextEditingController.text,
                                    password:
                                        _passwordTextEditingController.text));
                              }
                            },
                            child: const Text("Login"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
