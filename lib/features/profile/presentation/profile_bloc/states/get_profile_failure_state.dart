import 'profile_states.dart';

class GetProfileFailureState implements ProfileStates {
  final String message;

  const GetProfileFailureState(this.message);
}
