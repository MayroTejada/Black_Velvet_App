import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<void> login({required String email, required String password});
}

@injectable
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final PocketBaseModuleImpl module;

  AuthRemoteDataSourceImpl({required this.module});
  @override
  Future<void> login({required String email, required String password}) {
    return module.pocketBase
        .collection('users')
        .authWithPassword(email, password);
  }
}
