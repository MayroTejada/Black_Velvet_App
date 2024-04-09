import 'package:black_velvet_app/features/auth/data/services/pocket_base_auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class AuthRemoteDataSource {
  Future<RecordAuth> login({required String email, required String password});
  Future<RecordAuth> authWithToken();
}

@injectable
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final PocketBaseAuthServiceImpl service;

  AuthRemoteDataSourceImpl({required this.service});
  @override
  Future<RecordAuth> login({required String email, required String password}) {
    return service.login(email, password);
  }

  @override
  Future<RecordAuth> authWithToken() async {
    return service.authWithToken();
  }
}
