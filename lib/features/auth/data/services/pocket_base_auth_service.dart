import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class PocketBaseAuthService {
  Future<RecordAuth> authWithToken();
  Future<RecordAuth> login(String email, String password);
}

@Injectable(as: PocketBaseAuthService)
class PocketBaseAuthServiceImpl implements PocketBaseAuthService {
  final PocketBaseModuleImpl module;

  PocketBaseAuthServiceImpl({required this.module});
  @override
  Future<RecordAuth> authWithToken() async {
    if (module.pocketBase.authStore.isValid) {
      return module.pocketBase.collection('users').authRefresh();
    } else {
      throw Exception();
    }
  }

  @override
  Future<RecordAuth> login(String email, String password) {
    return module.pocketBase
        .collection('users')
        .authWithPassword(email, password);
  }
}
