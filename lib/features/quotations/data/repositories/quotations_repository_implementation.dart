import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/quotations.dart';
import '../../domain/repositories/quotations_repository.dart';

class QuotationsRepositoryImplementation implements QuotationsRepository {
  QuotationsRepositoryImplementation();

  @override
  Future<Either<Failure, Quotations>> call() async {
    throw UnimplementedError();
  }
}
