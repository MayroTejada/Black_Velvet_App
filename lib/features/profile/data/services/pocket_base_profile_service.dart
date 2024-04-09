import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class PocketBaseProfileService {
  Future<RecordModel> getProfile(String profileId);
}

@injectable
class PocketBaseProfileServiceImpl implements PocketBaseProfileService {
  final PocketBaseModuleImpl module;

  PocketBaseProfileServiceImpl({required this.module});
  @override
  Future<RecordModel> getProfile(String profileId) {
    return module.pocketBase.collection('profiles').getOne(profileId);
  }
}
