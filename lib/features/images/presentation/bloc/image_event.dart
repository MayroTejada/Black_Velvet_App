part of 'image_bloc.dart';

class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class LoadImageByCollectionEvent extends ImageEvent {
  final String imageId;
  final String recordId;
  final String collectionName;

  const LoadImageByCollectionEvent(
      {required this.imageId,
      required this.collectionName,
      required this.recordId});
}
