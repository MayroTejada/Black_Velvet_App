part of 'image_bloc.dart';

enum ImageStateEnum { initial, loading, loaded, error }

class ImageState extends Equatable {
  final String? imageUrl;
  final ImageStateEnum imageStateEnum;
  const ImageState({this.imageUrl, required this.imageStateEnum});

  @override
  List<Object?> get props => [imageUrl];

  ImageState initialState() {
    return const ImageState(imageStateEnum: ImageStateEnum.initial);
  }

  ImageState loadedState(String imageUrl) {
    return ImageState(
        imageStateEnum: ImageStateEnum.loaded, imageUrl: imageUrl);
  }

  ImageState failedState(String error) {
    return ImageState(imageStateEnum: ImageStateEnum.error, imageUrl: imageUrl);
  }
}
