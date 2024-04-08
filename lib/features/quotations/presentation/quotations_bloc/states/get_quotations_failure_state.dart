import 'quotations_states.dart';

class GetQuotationsFailureState implements QuotationsStates {
  final String message;

  const GetQuotationsFailureState(this.message);
}
