import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/core/usecases/usecase.dart';
import 'package:black_velvet_app/features/login/data/repositories/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class Login implements UseCase<void, LoginParams> {
  final AuthRepositoryImpl repository;

  Login({required this.repository});
  @override
  Future<Either<Failure, void>> call(LoginParams params) {
    return repository.login(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}
