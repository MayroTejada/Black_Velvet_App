import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepository {
  Future<Either<Failure, String>> loadImageByCollection(
      String collection, String imageId, String recordId);
}
