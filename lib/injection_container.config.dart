// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import 'core/network/local_storage.dart' as _i8;
import 'features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i3;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i4;
import 'features/auth/domain/use_cases/login.dart' as _i5;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i7;

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
    gh.factory<_i3.AuthRemoteDataSourceImpl>(
        () => _i3.AuthRemoteDataSourceImpl());
    gh.factory<_i4.AuthRepositoryImpl>(() => _i4.AuthRepositoryImpl(
        remoteDataSourceImpl: gh<_i3.AuthRemoteDataSourceImpl>()));
    gh.factory<_i5.Login>(
        () => _i5.Login(repository: gh<_i4.AuthRepositoryImpl>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i7.AuthBloc>(() => _i7.AuthBloc(login: gh<_i5.Login>()));
    return this;
  }
}

class _$InjectionModule extends _i8.InjectionModule {}
