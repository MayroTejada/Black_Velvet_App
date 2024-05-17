import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:black_velvet_app/app_router.dart';
import 'package:black_velvet_app/core/components/black_velvet_flushbar.dart';
import 'package:black_velvet_app/core/components/form_container_velvet.dart';
import 'package:black_velvet_app/core/components/velvet_Elevated_button.dart';
import 'package:black_velvet_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:black_velvet_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ScrollController scrollController = ScrollController();
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
        create: (context) => getIt<LoginBloc>(),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.loginStateEnum == LoginStateEnum.success) {
              showVelvetFlushbar(
                      context: context, title: 'success', message: '<3')
                  .then((value) {
                context.router.replace(const DashboardRoute());
              });
            } else if (state.loginStateEnum == LoginStateEnum.failure) {
              Flushbar(
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 5),
                title: 'ERROR ${state.failure?.code ?? 500}!!',
                message: state.failure?.message ?? 'unknown error',
              ).show(context);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return Scrollbar(
                controller: scrollController,
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(50),
                  child: Center(
                    child: FormContainerVelvet(
                      maxSize: Size(MediaQuery.of(context).size.width * .8,
                          MediaQuery.of(context).size.height * .8),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Inicia sesion',
                              style: TextStyle(fontSize: 26),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Center(
                                child: SizedBox(
                                  height: 400,
                                  width: 400,
                                  child: Form(
                                    key: formKey,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: ResponsiveRowColumn(
                                      rowSpacing: 30,
                                      columnSpacing: 30,
                                      layout: ResponsiveRowColumnType.COLUMN,
                                      children: [
                                        ResponsiveRowColumnItem(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Email"),
                                            onSubmitted: (value) {},
                                            style: const TextStyle(),
                                            controller:
                                                _emailTextEditingController,
                                          ),
                                        ),
                                        ResponsiveRowColumnItem(
                                          child: TextField(
                                            decoration: const InputDecoration(
                                                hintText: "Password"),
                                            onSubmitted: (value) {},
                                            style: const TextStyle(),
                                            controller:
                                                _passwordTextEditingController,
                                          ),
                                        ),
                                        ResponsiveRowColumnItem(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: VelvetElevatedButton(
                                              isLoading: state.loginStateEnum ==
                                                  LoginStateEnum.loading,
                                              onPressedCallback: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  context.read<LoginBloc>().add(
                                                      LoginEvent(
                                                          email:
                                                              _emailTextEditingController
                                                                  .text,
                                                          password:
                                                              _passwordTextEditingController
                                                                  .text));
                                                }
                                              },
                                              text: 'Log in',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
