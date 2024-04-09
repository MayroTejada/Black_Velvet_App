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

import 'core/network/local_storage.dart' as _i13;
import 'core/network/pocket_base_client.dart' as _i5;
import 'features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i4;
import 'features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i8;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i9;
import 'features/auth/data/services/pocket_base_auth_service.dart' as _i7;
import 'features/auth/domain/use_cases/auth_with_token.dart' as _i10;
import 'features/auth/domain/use_cases/login.dart' as _i11;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i12;
import 'features/login/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i6;

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
    gh.factory<_i6.AuthRemoteDataSourceImpl>(() =>
        _i6.AuthRemoteDataSourceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i7.PocketBaseAuthServiceImpl>(() =>
        _i7.PocketBaseAuthServiceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i8.AuthRemoteDataSourceImpl>(() => _i8.AuthRemoteDataSourceImpl(
        service: gh<_i7.PocketBaseAuthServiceImpl>()));
    gh.factory<_i9.AuthRepositoryImpl>(() => _i9.AuthRepositoryImpl(
          remoteDataSourceImpl: gh<_i8.AuthRemoteDataSourceImpl>(),
          locaDataSourceImpl: gh<_i4.AuthLocaDataSourceImpl>(),
        ));
    gh.factory<_i10.AuthWithToken>(
        () => _i10.AuthWithToken(repository: gh<_i9.AuthRepositoryImpl>()));
    gh.factory<_i11.Login>(
        () => _i11.Login(repository: gh<_i9.AuthRepositoryImpl>()));
    gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(
          login: gh<_i11.Login>(),
          authWithToken: gh<_i10.AuthWithToken>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i13.InjectionModule {}
