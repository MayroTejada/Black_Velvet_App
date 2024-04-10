// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

enum AuthStateEnum { initial, success, failure, loading }

class AuthState extends Equatable {
  final User? user;
  final AuthStateEnum? authStateEnum;
  final Failure? failure;

  const AuthState({this.user, this.authStateEnum, this.failure});

  AuthState initialState() {
    return AuthState(user: user, authStateEnum: AuthStateEnum.initial);
  }

  AuthState loadingState() {
    return AuthState(user: user, authStateEnum: AuthStateEnum.loading);
  }

  AuthState authSuccesfullyState(User user) {
    return AuthState(user: user, authStateEnum: AuthStateEnum.success);
  }

  AuthState authFailedState(Failure error) {
    return AuthState(
        user: user, authStateEnum: AuthStateEnum.failure, failure: error);
  }

  AuthState copyWith({User? user, AuthStateEnum? authStateEnum}) {
    return AuthState(
        user: user ?? this.user,
        authStateEnum: authStateEnum ?? this.authStateEnum);
  }

  @override
  List<Object?> get props => [user, authStateEnum];
}
