import 'package:black_velvet_app/features/images/data/services/pocket_base_image_service.dart';
import 'package:injectable/injectable.dart';

abstract class ImageRemoteDataSource {
  Future<Uri> loadImageByCollection(
      {required String collectionName,
      required String imageId,
      required String recordId});
}

@Injectable(as: ImageRemoteDataSource)
class AuthRemoteDataSourceImpl extends ImageRemoteDataSource {
  final PocketBaseImageService service;

  AuthRemoteDataSourceImpl({required this.service});
  @override
  Future<Uri> loadImageByCollection(
      {required String collectionName,
      required String imageId,
      required String recordId}) {
    return service.loadImageByCollection(collectionName, imageId, recordId);
  }
}
