import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../shared/domain/entities/user.dart';
import '../../domain/use_cases/auth_with_token.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthWithToken authWithToken;
  AuthBloc({
    required this.authWithToken,
  }) : super(const AuthState().initialState()) {
    on<CheckAuthEvent>(checkAuthEvent);
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
