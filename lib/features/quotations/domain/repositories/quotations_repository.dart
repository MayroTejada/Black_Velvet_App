import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/quotations.dart';

abstract class QuotationsRepository {
  Future<Either<Failure, Quotations>> call();
}
