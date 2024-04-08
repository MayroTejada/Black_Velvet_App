import 'package:black_velvet_app/features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart';
import 'package:black_velvet_app/features/auth/data/models/user_model.dart';
import 'package:black_velvet_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/failures/failure.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/user.dart';

@injectable
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;

  AuthRepositoryImpl({required this.remoteDataSourceImpl});
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      RecordAuth res =
          await remoteDataSourceImpl.login(email: email, password: password);
      getIt<SharedPreferences>().setString('token', res.token);
      var user = UserModel.fromJson(res.record!.data);
      return Right(user);
    } on Exception catch (e) {
      print(e);
      return const Left(Failure());
    }
  }
}
