import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cake_quote_event.dart';
part 'cake_quote_state.dart';

class CakeQuoteBloc extends Bloc<CakeQuoteEvent, CakeQuoteState> {
  CakeQuoteBloc() : super(CakeQuoteInitial()) {
    on<CakeQuoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
