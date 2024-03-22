import 'package:black_velvet_app/features/login/domain/use_cases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthBloc({required this.login}) : super(AuthInitial()) {
    on<SignInEvent>(signInEvent);
  }

  Future<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    if (kDebugMode) {
      emit(AuthSuccess());
    } else {
      final res = await login
          .call(LoginParams(email: event.email, password: event.password));
      res.fold((l) => emit(AuthFailed()), (r) => emit(AuthSuccess()));
    }
  }
}
