import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';
import '../models/profile_model.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Profile>> getProfile(String profileId) async {
    try {
      var res = await datasource.getProfile(profileId);
      var profile = ProfileModel.fromJson(res.data);
      return Right(profile);
    } on Exception catch (e) {
      return const Left(Failure());
    }
  }
}
