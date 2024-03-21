import 'package:black_velvet_app/features/login/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:black_velvet_app/features/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../core/failures/failure.dart';

@injectable
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;

  AuthRepositoryImpl({required this.remoteDataSourceImpl});
  @override
  Future<Either<Failure, void>> login(String email, String password) async {
    try {
      var res =
          await remoteDataSourceImpl.login(email: email, password: password);
      return Right(res);
    } on ClientException catch (e) {
      print(e);
      return const Left(Failure());
    }
  }
}
