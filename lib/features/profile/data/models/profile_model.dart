// ignore_for_file: overridden_fields

import 'package:black_velvet_app/features/profile/domain/entities/profile.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Profile {
  @override
  @JsonKey(name: 'full_name')
  final String name;
  @override
  @JsonKey(name: 'avatar')
  final String avatar;
  @override
  @JsonKey(name: 'recordId')
  final String id;
  @override
  @JsonKey(name: 'collectionId')
  final String collectionId;
  const ProfileModel({
    required this.avatar,
    required this.collectionId,
    required this.name,
    required this.id,
  }) : super(
            avatar: avatar,
            name: name,
            id: id,
            phoneNumber: '',
            email: '',
            collectionId: collectionId);
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
