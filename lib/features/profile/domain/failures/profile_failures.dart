import 'package:black_velvet_app/core/failures/failure.dart';


abstract class ProfileFailures implements Failure {
  final String message;

  const ProfileFailures({required this.message});
}
