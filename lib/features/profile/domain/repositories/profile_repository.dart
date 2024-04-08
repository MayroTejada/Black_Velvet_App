import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/features/profile/domain/usecases/get_profile.dart';
import 'package:dartz/dartz.dart';

import '../entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> call(int parameters);
}
