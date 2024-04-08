import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';
import '../entities/profile_parameters.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> call(ProfileParameters parameters);
}
