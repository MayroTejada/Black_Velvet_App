import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

@injectable
final pb = PocketBase('http://127.0.0.1:8090/');
