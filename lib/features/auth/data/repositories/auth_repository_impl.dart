import 'package:black_velvet_app/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:black_velvet_app/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:black_velvet_app/features/auth/data/models/user_model.dart';
import 'package:black_velvet_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../core/failures/failure.dart';
import '../../domain/entities/user.dart';

@injectable
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;
  final AuthLocaDataSourceImpl locaDataSourceImpl;

  AuthRepositoryImpl(
      {required this.remoteDataSourceImpl, required this.locaDataSourceImpl});
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      RecordAuth res =
          await remoteDataSourceImpl.login(email: email, password: password);
      var user = UserModel.fromJson(res.record!.data);
      return Right(user);
    } on Exception catch (e) {
      if (e is ClientException) {
        ClientException clientException = e;
        return Left(Failure(
            message: clientException.response['message'],
            code: clientException.response['code']));
      } else {
        return Left(Failure(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, User>> authWithToken() async {
    try {
      var res = await remoteDataSourceImpl.authWithToken();

      var user = UserModel.fromJson(res.record!.data);
      return Right(user);
    } on Exception catch (e) {
      print(e);
      return const Left(Failure());
    }
  }
}
