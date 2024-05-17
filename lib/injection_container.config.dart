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

import 'core/network/local_storage.dart' as _i28;
import 'core/network/pocket_base_client.dart' as _i5;
import 'features/auth/data/datasources/local_datasource/auth_local_datasource.dart'
    as _i4;
import 'features/auth/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i16;
import 'features/auth/data/repositories/auth_repository.dart' as _i19;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i18;
import 'features/auth/data/services/pocket_base_auth_service.dart' as _i12;
import 'features/auth/domain/repositories/auth_repository.dart' as _i17;
import 'features/auth/domain/use_cases/auth_with_token.dart' as _i20;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i26;
import 'features/images/data/datasources/remote_datasources/image_remote_datasource.dart'
    as _i21;
import 'features/images/data/repositories/image_repository_impl.dart' as _i23;
import 'features/images/data/services/pocket_base_image_service.dart' as _i13;
import 'features/images/domain/repositories/image_repository.dart' as _i22;
import 'features/images/domain/usecases/load_image_by_collection.dart' as _i24;
import 'features/images/presentation/bloc/image_bloc.dart' as _i27;
import 'features/login/data/datasources/remote_datasource/login_remote_datasource.dart'
    as _i11;
import 'features/login/presentation/bloc/login_bloc.dart' as _i25;
import 'features/profile/data/datasources/profile_remote_datasource.dart'
    as _i7;
import 'features/profile/data/repositories/profile_repository_impl.dart' as _i9;
import 'features/profile/data/services/pocket_base_profile_service.dart' as _i6;
import 'features/profile/domain/repositories/profile_repository.dart' as _i8;
import 'features/profile/domain/usecases/get_profile.dart' as _i10;
import 'features/profile/presentation/profile_bloc/profile_bloc.dart' as _i14;
import 'features/shared/data/datasources/remotes/user_remote_datasource.dart'
    as _i15;

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
    gh.factory<_i4.AuthLocaDataSource>(() => _i4.AuthLocaDataSourceImpl(
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
    gh.factory<_i10.GetProfile>(
        () => _i10.GetProfile(repository: gh<_i8.ProfileRepository>()));
    gh.factory<_i11.LoginRemoteDataSource>(() =>
        _i11.LoginRemoteDataSourceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i12.PocketBaseAuthService>(() =>
        _i12.PocketBaseAuthServiceImpl(module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i13.PocketBaseImageService>(() =>
        _i13.PocketBaseImageServiceImpl(
            module: gh<_i5.PocketBaseModuleImpl>()));
    gh.factory<_i14.ProfileBloc>(() => _i14.ProfileBloc(gh<_i10.GetProfile>()));
    gh.factory<_i15.UserRemoteDataSourceImpl>(() =>
        _i15.UserRemoteDataSourceImpl(
            service: gh<_i12.PocketBaseAuthService>()));
    gh.factory<_i16.AuthRemoteDataSource>(() => _i16.AuthRemoteDataSourceImpl(
        service: gh<_i12.PocketBaseAuthService>()));
    gh.factory<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
          remoteDataSourceImpl: gh<_i16.AuthRemoteDataSource>(),
          locaDataSourceImpl: gh<_i4.AuthLocaDataSource>(),
        ));
    gh.factory<_i19.AuthRepository>(() => _i19.AuthRepositoryImpl(
          remoteDataSourceImpl: gh<_i16.AuthRemoteDataSource>(),
          locaDataSourceImpl: gh<_i4.AuthLocaDataSource>(),
        ));
    gh.factory<_i20.AuthWithToken>(
        () => _i20.AuthWithToken(repository: gh<_i19.AuthRepository>()));
    gh.factory<_i21.ImageRemoteDataSource>(() => _i21.AuthRemoteDataSourceImpl(
        service: gh<_i13.PocketBaseImageService>()));
    gh.factory<_i22.ImageRepository>(() => _i23.ImageRepositorympl(
        remoteDataSource: gh<_i21.ImageRemoteDataSource>()));
    gh.factory<_i24.LoadImageByCollection>(() =>
        _i24.LoadImageByCollection(repository: gh<_i22.ImageRepository>()));
    gh.factory<_i25.LoginBloc>(() =>
        _i25.LoginBloc(remoteDataSourceImpl: gh<_i11.LoginRemoteDataSource>()));
    gh.factory<_i26.AuthBloc>(
        () => _i26.AuthBloc(authWithToken: gh<_i20.AuthWithToken>()));
    gh.factory<_i27.ImageBloc>(
        () => _i27.ImageBloc(gh<_i24.LoadImageByCollection>()));
    return this;
  }
}

class _$InjectionModule extends _i28.InjectionModule {}
