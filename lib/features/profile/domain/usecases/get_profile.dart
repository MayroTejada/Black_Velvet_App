import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

abstract class GetProfile {
  Future<Either<Failure, Profile>> call(GetProfileParameters parameters);
}

class GetProfileImplementation implements GetProfile {
  final ProfileRepository repository;

  GetProfileImplementation(this.repository);

  @override
  Future<Either<Failure, Profile>> call(GetProfileParameters parameters) async {
    return repository(parameters.profileId);
  }
}

class GetProfileParameters extends Equatable {
  final int profileId;

  const GetProfileParameters({required this.profileId});

  @override
  List<Object?> get props => [profileId];
}
