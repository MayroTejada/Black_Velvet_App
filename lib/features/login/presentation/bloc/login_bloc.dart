import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/features/login/data/datasources/remote_datasource/login_remote_datasource.dart';
import 'package:black_velvet_app/features/shared/data/models/user_model.dart';
import 'package:black_velvet_app/features/shared/domain/entities/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRemoteDataSource remoteDataSourceImpl;
  LoginBloc({required this.remoteDataSourceImpl})
      : super(const LoginState().initialState()) {
    on<LoginEvent>(_loginEvent);
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoginState().loadingState());
    try {
      RecordAuth res = await remoteDataSourceImpl.login(
          email: event.email, password: event.password);
      var user = UserModel.fromJson(res.record!.data);
      return emit(const LoginState().authSuccesfullyState(user));
    } on Exception catch (e) {
      if (e is ClientException) {
        ClientException clientException = e;
        return emit(const LoginState().authFailedState(Failure(
            message: clientException.response['message'],
            code: clientException.response['code'])));
      } else {
        return emit(const LoginState().authFailedState(const Failure()));
      }
    }
  }
}
