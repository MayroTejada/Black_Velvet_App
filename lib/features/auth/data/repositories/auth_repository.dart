import 'package:black_velvet_app/features/auth/data/datasources/local_datasource/auth_local_datasource.dart';
import 'package:black_velvet_app/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:black_velvet_app/features/shared/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failure.dart';
import '../../../shared/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> authWithToken();
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSourceImpl;
  final AuthLocaDataSource locaDataSourceImpl;

  AuthRepositoryImpl(
      {required this.remoteDataSourceImpl, required this.locaDataSourceImpl});

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
