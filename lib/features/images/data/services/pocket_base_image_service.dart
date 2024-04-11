import 'package:black_velvet_app/core/network/pocket_base_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pocketbase/pocketbase.dart';

abstract class PocketBaseImageService {
  Future<Uri> loadImageByCollection(
      String collectionName, String imageId, String recordId);
}

@Injectable(as: PocketBaseImageService)
class PocketBaseImageServiceImpl implements PocketBaseImageService {
  final PocketBaseModuleImpl module;

  PocketBaseImageServiceImpl({required this.module});

  @override
  Future<Uri> loadImageByCollection(
      String collectionName, String imageId, String recordId) async {
    return module.pocketBase.files.getUrl(
        RecordModel(collectionId: collectionName, id: recordId), imageId);
  }
}
