import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> login(String email, String password);
}

