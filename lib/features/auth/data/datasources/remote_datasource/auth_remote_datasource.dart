import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class AuthRemoteDataSource {
  Future<RecordAuth> login({required String email, required String password});
}

@injectable
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<RecordAuth> login({required String email, required String password}) {
    return pb.collection('users').authWithPassword(email, password);
  }
}
