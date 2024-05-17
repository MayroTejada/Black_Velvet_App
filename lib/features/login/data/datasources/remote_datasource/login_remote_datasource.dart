import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class LoginRemoteDataSource {
  Future<RecordAuth> login({required String email, required String password});
}

@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final PocketBaseModuleImpl module;

  LoginRemoteDataSourceImpl({required this.module});
  @override
  Future<RecordAuth> login({required String email, required String password}) {
    return module.pocketBase
        .collection('users')
        .authWithPassword(email, password);
  }
}
