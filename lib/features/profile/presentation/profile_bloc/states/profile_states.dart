import 'package:equatable/equatable.dart';

import '../../../domain/entities/profile.dart';

enum ProfileStateEnum { none, intial, loading, success, failed }

class ProfileState extends Equatable {
  final Profile? profile;
  final ProfileStateEnum? stateEnum;
  const ProfileState({this.profile, this.stateEnum});

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

  ProfileState failedState() {
    return const ProfileState(stateEnum: ProfileStateEnum.failed);
  }

  @override
  List<Object?> get props => [profile, stateEnum];
}
