import 'package:black_velvet_app/features/login/domain/use_cases/login.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthBloc({required this.login}) : super(AuthInitial()) {
    on<SignInEvent>(signInEvent);
  }

  Future<void> signInEvent(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await login
        .call(LoginParams(email: event.email, password: event.password));
    res.fold((l) => emit(AuthFailed()), (r) => emit(AuthSuccess()));
  }
}
