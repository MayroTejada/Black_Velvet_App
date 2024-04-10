import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/features/auth/domain/entities/user.dart';
import 'package:black_velvet_app/features/auth/domain/use_cases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/auth_with_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final AuthWithToken authWithToken;
  AuthBloc({
    required this.login,
    required this.authWithToken,
  }) : super(const AuthState().initialState()) {
    on<SignInEvent>(signInEvent);
    on<CheckAuthEvent>(checkAuthEvent);
  }

  Future<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState().loadingState());
    if (!kDebugMode) {
      emit(const AuthState());
    }
    final res = await login
        .call(LoginParams(email: event.email, password: event.password));
    res.fold((failure) => emit(state.authFailedState(failure)),
        (user) => emit(state.authSuccesfullyState(user)));
  }

  Future<void> checkAuthEvent(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    var res = await authWithToken.call(const AuthWithTokenParams());
    res.fold((failure) => emit(state.authFailedState(failure)), (user) {
      emit(state.authSuccesfullyState(user));
    });
  }
}
