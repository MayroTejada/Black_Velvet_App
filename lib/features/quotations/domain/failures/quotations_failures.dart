import 'package:black_velvet_app/core/failures/failure.dart';

abstract class QuotationsFailures implements Failure {
  @override
  final String message;

  const QuotationsFailures({required this.message});
}
