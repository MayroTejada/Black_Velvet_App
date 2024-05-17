import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String username;
  final String email;
  final String profileId;

  const User(
      {required this.username, required this.email, required this.profileId});

  @override
  List<Object?> get props => [username, email, profileId];
}
