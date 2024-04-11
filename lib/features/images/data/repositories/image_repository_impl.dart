import 'package:black_velvet_app/features/images/data/datasources/remote_datasources/image_remote_datasource.dart';
import 'package:black_velvet_app/features/images/data/mappers/image_mapper.dart';
import 'package:black_velvet_app/features/images/domain/repositories/image_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../core/failures/failure.dart';

@Injectable(as: ImageRepository)
class ImageRepositorympl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;

  ImageRepositorympl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> loadImageByCollection(
      String collectionName, String imageId, String recordId) async {
    try {
      Uri res = await remoteDataSource.loadImageByCollection(
          collectionName: collectionName, imageId: imageId, recordId: recordId);

      return Right(res.getImageURl());
    } on Exception catch (e) {
      if (e is ClientException) {
        ClientException clientException = e;
        return Left(Failure(
            message: clientException.response['message'],
            code: clientException.response['code']));
      } else {
        return Left(Failure(message: e.toString()));
      }
    }
  }
}
