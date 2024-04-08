import '../../domain/entities/profile.dart';
import '../../domain/entities/profile_parameters.dart';

abstract class ProfileDatasource {
  Future<Profile> call(ProfileParameters parameters);
}

class ProfileDatasourceImplementation implements ProfileDatasource {
  ProfileDatasourceImplementation();

  @override
  Future<Profile> call(ProfileParameters parameters) async {
    throw UnimplementedError();
  }
}
