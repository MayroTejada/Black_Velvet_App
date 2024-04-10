import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/profile.dart';

enum ProfileStateEnum { none, intial, loading, success, failed }

class ProfileState extends Equatable {
  final Profile? profile;
  final Failure? failure;
  final ProfileStateEnum? stateEnum;
  const ProfileState({this.profile, this.stateEnum, this.failure});

  ProfileState initialState() {
    return const ProfileState(
        profile: null, stateEnum: ProfileStateEnum.intial);
  }

  ProfileState loadingState() {
    return const ProfileState(stateEnum: ProfileStateEnum.loading);
  }

  ProfileState successlState({Profile? profile}) {
    return ProfileState(stateEnum: ProfileStateEnum.success, profile: profile);
  }

  ProfileState failedState(Failure failure) {
    return ProfileState(stateEnum: ProfileStateEnum.failed, failure: failure);
  }

  @override
  List<Object?> get props => [profile, stateEnum];
}
