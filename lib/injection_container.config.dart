// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/login/data/datasources/remote_datasource/auth_remote_datasource.dart'
    as _i3;
import 'features/login/data/repositories/auth_repository_impl.dart' as _i4;
import 'features/login/domain/use_cases/login.dart' as _i5;
import 'features/login/presentation/bloc/auth_bloc.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthRemoteDataSourceImpl>(
        () => _i3.AuthRemoteDataSourceImpl());
    gh.factory<_i4.AuthRepositoryImpl>(() => _i4.AuthRepositoryImpl(
        remoteDataSourceImpl: gh<_i3.AuthRemoteDataSourceImpl>()));
    gh.factory<_i5.Login>(
        () => _i5.Login(repository: gh<_i4.AuthRepositoryImpl>()));
    gh.singleton<_i6.AuthBloc>(() => _i6.AuthBloc(login: gh<_i5.Login>()));
    return this;
  }
}
