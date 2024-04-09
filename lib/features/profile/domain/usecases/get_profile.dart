import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetProfile implements UseCase<Profile, GetProfileParameters> {
  final ProfileRepository repository;

  GetProfile({required this.repository});

  @override
  Future<Either<Failure, Profile>> call(GetProfileParameters parameters) async {
    return repository.getProfile(parameters.profileId);
  }
}

class GetProfileParameters extends Equatable {
  final String profileId;

  const GetProfileParameters({required this.profileId});

  @override
  List<Object?> get props => [profileId];
}
