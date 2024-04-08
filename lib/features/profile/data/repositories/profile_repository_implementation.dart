import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/profile.dart';
import '../../domain/entities/profile_parameters.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../errors/profile_error.dart';

class ProfileRepositoryImplementation implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, Profile>> call(ProfileParameters parameters) async {
    try {
      return Right(await datasource(parameters));
    } on ProfileError catch (e) {
      throw UnimplementedError();
    } on Exception catch (e) {
      throw UnimplementedError();
    }
  }
}
