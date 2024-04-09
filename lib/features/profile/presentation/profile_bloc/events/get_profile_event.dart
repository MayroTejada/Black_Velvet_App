import 'profile_events.dart';

class GetProfileEvent implements ProfileEvents {
  final String profileId;
  const GetProfileEvent({required this.profileId});
}
