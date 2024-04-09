// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'core/network/local_storage.dart' as _i19;
import 'core/network/pocket_base_client.dart' as _i5;
import 'features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i4;
import 'features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i14;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i15;
import 'features/auth/data/services/pocket_base_auth_service.dart' as _i12;
import 'features/auth/domain/use_cases/auth_with_token.dart' as _i16;
import 'features/auth/domain/use_cases/login.dart' as _i17;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i18;
import 'features/login/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i10;
import 'features/profile/data/datasources/profile_remote_datasource.dart'
    as _i7;
import 'features/profile/data/repositories/profile_repository_impl.dart' as _i9;
import 'features/profile/data/services/pocket_base_profile_service.dart' as _i6;
import 'features/profile/domain/repositories/profile_repository.dart' as _i8;
import 'features/profile/domain/usecases/get_profile.dart' as _i11;
import 'features/profile/presentation/profile_bloc/profile_bloc.dart' as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i4.AuthLocaDataSourceImpl>(() => _i4.AuthLocaDataSourceImpl(
        sharedPreferences: gh<_i3.SharedPreferences>()));
    gh.singleton<_i5.PocketBaseModuleImpl>(() => _i5.PocketBaseModuleImpl(
        sharedPreferences: gh<_i3.SharedPreferences>()));
    gh.factory<_i6.PocketBaseProfileServiceImpl>(() =>
        _i6.PocketBaseProfileServiceImpl(
            module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i7.ProfileDatasource>(() => _i7.ProfileDatasourceImpl(
        service: gh<_i6.PocketBaseProfileServiceImpl>()));
    gh.factory<_i8.ProfileRepository>(
        () => _i9.ProfileRepositoryImpl(gh<_i7.ProfileDatasource>()));
    gh.factory<_i10.AuthRemoteDataSourceImpl>(() =>
        _i10.AuthRemoteDataSourceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i11.GetProfile>(
        () => _i11.GetProfile(repository: gh<_i8.ProfileRepository>()));
    gh.factory<_i12.PocketBaseAuthServiceImpl>(() =>
        _i12.PocketBaseAuthServiceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i13.ProfileBloc>(() => _i13.ProfileBloc(gh<_i11.GetProfile>()));
    gh.factory<_i14.AuthRemoteDataSourceImpl>(() =>
        _i14.AuthRemoteDataSourceImpl(
            service: gh<_i12.PocketBaseAuthServiceImpl>()));
    gh.factory<_i15.AuthRepositoryImpl>(() => _i15.AuthRepositoryImpl(
          remoteDataSourceImpl: gh<_i14.AuthRemoteDataSourceImpl>(),
          locaDataSourceImpl: gh<_i4.AuthLocaDataSourceImpl>(),
        ));
    gh.factory<_i16.AuthWithToken>(
        () => _i16.AuthWithToken(repository: gh<_i15.AuthRepositoryImpl>()));
    gh.factory<_i17.Login>(
        () => _i17.Login(repository: gh<_i15.AuthRepositoryImpl>()));
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
          login: gh<_i17.Login>(),
          authWithToken: gh<_i16.AuthWithToken>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i19.InjectionModule {}
