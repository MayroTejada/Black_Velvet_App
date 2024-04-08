import '../../../domain/entities/quotations.dart';
import 'quotations_states.dart';

class GetQuotationsSuccessState implements QuotationsStates {
  final Quotations quotations;

  const GetQuotationsSuccessState(this.quotations);
}
