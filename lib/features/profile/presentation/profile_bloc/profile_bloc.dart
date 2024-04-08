import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_profile.dart';
import 'events/get_profile_event.dart';
import 'events/profile_events.dart';
import 'states/get_profile_failure_state.dart';
import 'states/get_profile_loading_state.dart';
import 'states/get_profile_success_state.dart';
import 'states/profile_initial_state.dart';
import 'states/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates>
    implements Disposable {
  final GetProfile usecase;

  ProfileBloc(this.usecase) : super(const ProfileInitialState()) {
    on<GetProfileEvent>(_mapGetProfileEventToState);
  }

  @override
  Future<void> dispose() async => close();

  FutureOr<void> _mapGetProfileEventToState(
      GetProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(const GetProfileLoadingState());

    final result = await usecase(event.parameters);

    result.fold(
      (l) => emit(GetProfileFailureState(l.message)),
      (r) {
        emit(GetProfileSuccessState(r));
      },
    );
  }

  @override
  FutureOr onDispose() {
    // TODO: implement onDispose
    throw UnimplementedError();
  }
}
