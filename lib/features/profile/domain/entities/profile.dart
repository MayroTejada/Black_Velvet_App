import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final String avatar;
  final String collectionId;

  const Profile({
    required this.collectionId,
    required this.id,
    required this.avatar,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, phoneNumber, email, avatar];
}
