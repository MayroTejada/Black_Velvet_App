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

import 'core/network/local_storage.dart' as _i25;
import 'core/network/pocket_base_client.dart' as _i5;
import 'features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i4;
import 'features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i15;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i16;
import 'features/auth/data/services/pocket_base_auth_service.dart' as _i12;
import 'features/auth/domain/use_cases/auth_with_token.dart' as _i17;
import 'features/auth/domain/use_cases/login.dart' as _i22;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i23;
import 'features/images/data/datasources/remote_datasources/image_remote_datasource.dart'
    as _i18;
import 'features/images/data/repositories/image_repository_impl.dart' as _i20;
import 'features/images/data/services/pocket_base_image_service.dart' as _i13;
import 'features/images/domain/repositories/image_repository.dart' as _i19;
import 'features/images/domain/usecases/load_image_by_collection.dart' as _i21;
import 'features/images/presentation/bloc/image_bloc.dart' as _i24;
import 'features/login/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i10;
import 'features/profile/data/datasources/profile_remote_datasource.dart'
    as _i7;
import 'features/profile/data/repositories/profile_repository_impl.dart' as _i9;
import 'features/profile/data/services/pocket_base_profile_service.dart' as _i6;
import 'features/profile/domain/repositories/profile_repository.dart' as _i8;
import 'features/profile/domain/usecases/get_profile.dart' as _i11;
import 'features/profile/presentation/profile_bloc/profile_bloc.dart' as _i14;

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
    gh.factory<_i13.PocketBaseImageService>(() =>
        _i13.PocketBaseImageServiceImpl(
            module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i14.ProfileBloc>(() => _i14.ProfileBloc(gh<_i11.GetProfile>()));
    gh.factory<_i15.AuthRemoteDataSourceImpl>(() =>
        _i15.AuthRemoteDataSourceImpl(
            service: gh<_i12.PocketBaseAuthServiceImpl>()));
    gh.factory<_i16.AuthRepositoryImpl>(() => _i16.AuthRepositoryImpl(
          remoteDataSourceImpl: gh<_i15.AuthRemoteDataSourceImpl>(),
          locaDataSourceImpl: gh<_i4.AuthLocaDataSourceImpl>(),
        ));
    gh.factory<_i17.AuthWithToken>(
        () => _i17.AuthWithToken(repository: gh<_i16.AuthRepositoryImpl>()));
    gh.factory<_i18.ImageRemoteDataSource>(() => _i18.AuthRemoteDataSourceImpl(
        service: gh<_i13.PocketBaseImageService>()));
    gh.factory<_i19.ImageRepository>(() => _i20.ImageRepositorympl(
        remoteDataSource: gh<_i18.ImageRemoteDataSource>()));
    gh.factory<_i21.LoadImageByCollection>(() =>
        _i21.LoadImageByCollection(repository: gh<_i19.ImageRepository>()));
    gh.factory<_i22.Login>(
        () => _i22.Login(repository: gh<_i16.AuthRepositoryImpl>()));
    gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
          login: gh<_i22.Login>(),
          authWithToken: gh<_i17.AuthWithToken>(),
        ));
    gh.factory<_i24.ImageBloc>(
        () => _i24.ImageBloc(gh<_i21.LoadImageByCollection>()));
    return this;
  }
}

class _$InjectionModule extends _i25.InjectionModule {}
