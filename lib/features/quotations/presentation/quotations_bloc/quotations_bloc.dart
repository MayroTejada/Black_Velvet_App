import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_quotations.dart';
import 'events/get_quotations_event.dart';
import 'events/quotations_events.dart';
import 'states/get_quotations_failure_state.dart';
import 'states/get_quotations_loading_state.dart';
import 'states/get_quotations_success_state.dart';
import 'states/quotations_initial_state.dart';
import 'states/quotations_states.dart';

class QuotationsBloc extends Bloc<QuotationsEvents, QuotationsStates>
    implements Disposable {
  final GetQuotations usecase;

  QuotationsBloc(this.usecase) : super(const QuotationsInitialState()) {
    on<GetQuotationsEvent>(_mapGetQuotationsEventToState);
  }

  FutureOr<void> _mapGetQuotationsEventToState(
      GetQuotationsEvent event, Emitter<QuotationsStates> emit) async {
    emit(const GetQuotationsLoadingState());

    final result = await usecase();

    result.fold(
      (l) => emit(GetQuotationsFailureState(l.message)),
      (r) {
        emit(GetQuotationsSuccessState(r));
      },
    );
  }

  @override
  FutureOr onDispose() {
    throw UnimplementedError();
  }
}
