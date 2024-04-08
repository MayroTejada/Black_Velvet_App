import '../../../domain/entities/profile.dart';
import 'profile_states.dart';

class GetProfileSuccessState implements ProfileStates {
  final Profile profile;

  const GetProfileSuccessState(this.profile);
}
