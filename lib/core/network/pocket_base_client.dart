import 'package:black_velvet_app/core/constants/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';


PocketBase buildClient(String baseUrl,
    {required SharedPreferences sharedPreferences}) {
  final String? persistToken = sharedPreferences.getString('token');
  final customAuthStore = AsyncAuthStore(
    initial: persistToken,
    save: (token) => sharedPreferences.setString('token', token),
    clear: () => sharedPreferences.setString('token', ''),
  );
  return PocketBase(baseUrl, authStore: customAuthStore);
}
abstract class RegisterPocketBaseModule {
  PocketBase get pocketBase;
}

@singleton
class PocketBaseModuleImpl implements RegisterPocketBaseModule {
  final SharedPreferences sharedPreferences;

  PocketBaseModuleImpl({required this.sharedPreferences});
  @override
  PocketBase get pocketBase =>
      buildClient(baseUrl, sharedPreferences: sharedPreferences);
}


