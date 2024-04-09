import 'package:black_velvet_app/features/profile/data/services/pocket_base_profile_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class ProfileDatasource {
  Future<RecordModel> getProfile(String profileId);
}

@Injectable(as: ProfileDatasource)
class ProfileDatasourceImpl implements ProfileDatasource {
  final PocketBaseProfileServiceImpl service;

  ProfileDatasourceImpl({required this.service});

  @override
  Future<RecordModel> getProfile(String profileId) async {
    return service.getProfile(profileId);
  }
}
