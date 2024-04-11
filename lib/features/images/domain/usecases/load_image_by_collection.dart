import 'package:black_velvet_app/core/failures/failure.dart';
import 'package:black_velvet_app/core/usecases/usecase.dart';
import 'package:black_velvet_app/features/images/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadImageByCollection
    implements UseCase<String, LoadImageByCollectionParams> {
  final ImageRepository repository;

  LoadImageByCollection({required this.repository});
  @override
  Future<Either<Failure, String>> call(LoadImageByCollectionParams params) {
    return repository.loadImageByCollection(
        params.nameCollection, params.imageId, params.recordId);
  }
}

class LoadImageByCollectionParams extends Equatable {
  final String nameCollection;
  final String imageId;
  final String recordId;
  const LoadImageByCollectionParams(
      {required this.imageId,
      required this.nameCollection,
      required this.recordId});
  @override
  List<Object?> get props => [];
}
