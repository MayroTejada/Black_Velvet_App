import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/quotations.dart';
import '../repositories/quotations_repository.dart';

abstract class GetQuotations {
  Future<Either<Failure, Quotations>> call();
}

class GetQuotationsImplementation implements GetQuotations {
  final QuotationsRepository repository;

  GetQuotationsImplementation(this.repository);

  @override
  Future<Either<Failure, Quotations>> call() async {
    return repository();
  }
}
