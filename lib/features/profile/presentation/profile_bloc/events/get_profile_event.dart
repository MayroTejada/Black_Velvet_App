import '../../../domain/entities/profile_parameters.dart';
import 'profile_events.dart';

class GetProfileEvent implements ProfileEvents {
  final ProfileParameters parameters;

  const GetProfileEvent(this.parameters);
}
