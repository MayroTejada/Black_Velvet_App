import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';
import '../entities/profile_parameters.dart';
import '../repositories/profile_repository.dart';

abstract class GetProfile {
  Future<Either<Failure, Profile>> call(ProfileParameters parameters);
}

class GetProfileImplementation implements GetProfile {
  final ProfileRepository repository;

  GetProfileImplementation(this.repository);

  @override
  Future<Either<Failure, Profile>> call(ProfileParameters parameters) async {
    return repository(parameters);
  }
}
