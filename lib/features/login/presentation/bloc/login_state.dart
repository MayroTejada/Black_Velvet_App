// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

enum LoginStateEnum { initial, success, failure, loading }

class LoginState extends Equatable {
  final User? user;
  final LoginStateEnum? loginStateEnum;
  final Failure? failure;

  const LoginState({this.user, this.loginStateEnum, this.failure});

  LoginState initialState() {
    return LoginState(user: user, loginStateEnum: LoginStateEnum.initial);
  }

  LoginState loadingState() {
    return LoginState(user: user, loginStateEnum: LoginStateEnum.loading);
  }

  LoginState authSuccesfullyState(User user) {
    return LoginState(user: user, loginStateEnum: LoginStateEnum.success);
  }

  LoginState authFailedState(Failure error) {
    return LoginState(
        user: user, loginStateEnum: LoginStateEnum.failure, failure: error);
  }

  LoginState copyWith({User? user, LoginStateEnum? loginStateEnum}) {
    return LoginState(
        user: user ?? this.user,
        loginStateEnum: loginStateEnum ?? this.loginStateEnum);
  }

  @override
  List<Object?> get props => [user, loginStateEnum];
}
