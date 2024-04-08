import 'package:black_velvet_app/injection_container.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
final pb = PocketBase('http://127.0.0.1:8090/', authStore: customAuthStore);

final customAuthStore = AsyncAuthStore(
  initial: getIt<SharedPreferences>().getString('token'),
  save: (token) => getIt<SharedPreferences>().setString('token', token),
  clear: () => getIt<SharedPreferences>().setString('token', ''),
);
