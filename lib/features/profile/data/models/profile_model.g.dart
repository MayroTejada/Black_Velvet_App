// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      avatar: json['avatar'] as String,
      collectionId: json['collectionId'] as String,
      name: json['full_name'] as String,
      id: json['recordId'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'avatar': instance.avatar,
      'recordId': instance.id,
      'collectionId': instance.collectionId,
    };
