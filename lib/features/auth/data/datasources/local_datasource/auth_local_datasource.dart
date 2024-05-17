import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocaDataSource {
  Future<String?> getToken();
  Future<bool> saveToken(String token);
}

@Injectable(as: AuthLocaDataSource)
class AuthLocaDataSourceImpl extends AuthLocaDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocaDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString('token');
  }

  @override
  Future<bool> saveToken(String token) {
    return sharedPreferences.setString('token', token);
  }
}
