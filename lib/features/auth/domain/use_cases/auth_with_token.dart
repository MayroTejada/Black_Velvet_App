import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/core/usecases/usecase.dart';
import 'package:black_velvet_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:black_velvet_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthWithToken implements UseCase<User, AuthWithTokenParams> {
  final AuthRepositoryImpl repository;

  AuthWithToken({required this.repository});
  @override
  Future<Either<Failure, User>> call(AuthWithTokenParams params) {
    return repository.authWithToken();
  }
}

class AuthWithTokenParams extends Equatable {
  const AuthWithTokenParams();
  @override
  List<Object?> get props => [];
}
