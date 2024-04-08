import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRemoteDataSource {
  Future<void> login({required String email, required String password});
}

@injectable
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<void> login({required String email, required String password}) {
    pb;
    return pb.collection('users').authWithPassword(email, password);
  }
}
