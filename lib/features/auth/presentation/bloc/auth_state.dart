// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

enum AuthStateEnum { initial, success, failure, loading }

class AuthState extends Equatable {
  final User? user;
  final AuthStateEnum? authStateEnum;

  const AuthState({this.user, this.authStateEnum});

  AuthState initialState() {
    return AuthState(user: user, authStateEnum: AuthStateEnum.initial);
  }

  AuthState loadingState() {
    return AuthState(user: user, authStateEnum: AuthStateEnum.loading);
  }

  AuthState authSuccesfullyState(User user) {
    return AuthState(user: user, authStateEnum: AuthStateEnum.success);
  }

  AuthState authFailedState(String error) {
    return AuthState(user: user, authStateEnum: AuthStateEnum.failure);
  }

  AuthState copyWith({User? user, AuthStateEnum? authStateEnum}) {
    return AuthState(
        user: user ?? this.user,
        authStateEnum: authStateEnum ?? this.authStateEnum);
  }

  @override
  List<Object?> get props => [user, authStateEnum];
}
