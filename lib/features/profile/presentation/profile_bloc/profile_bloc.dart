import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_profile.dart';
import 'events/get_profile_event.dart';
import 'events/profile_events.dart';
import 'states/profile_states.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvents, ProfileState>
    implements Disposable {
  final GetProfile usecase;

  ProfileBloc(this.usecase) : super(const ProfileState().initialState()) {
    on<GetProfileEvent>(_mapGetProfileEventToState);
  }

  FutureOr<void> _mapGetProfileEventToState(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(state.loadingState());

    final result =
        await usecase.call(GetProfileParameters(profileId: event.profileId));

    result.fold(
      (l) => emit(state.failedState()),
      (r) {
        emit(state.successlState(profile: r));
      },
    );
  }

  @override
  FutureOr onDispose() {
    // TODO: implement onDispose
    throw UnimplementedError();
  }
}
