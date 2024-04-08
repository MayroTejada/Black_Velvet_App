import '../../domain/entities/profile.dart';

abstract class ProfileDatasource {
  Future<Profile> call(int parameters);
}

class ProfileDatasourceImplementation implements ProfileDatasource {
  ProfileDatasourceImplementation();

  @override
  Future<Profile> call(int parameters) async {
    throw UnimplementedError();
  }
}
