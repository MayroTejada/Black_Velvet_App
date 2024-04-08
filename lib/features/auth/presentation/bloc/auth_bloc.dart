import 'package:black_velvet_app/features/auth/domain/entities/user.dart';
import 'package:black_velvet_app/features/auth/domain/use_cases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthBloc({required this.login}) : super(const AuthState().initialState()) {
    on<SignInEvent>(signInEvent);
  }

  Future<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState().loadingState());
    if (!kDebugMode) {
      emit(const AuthState());
    } else {
      final res = await login
          .call(LoginParams(email: event.email, password: event.password));
      res.fold((l) => emit(const AuthState().authFailedState('error')),
          (user) => emit(const AuthState().authSuccesfullyState(user)));
    }
  }
}
