import 'dart:async';

import 'package:black_velvet_app/features/images/domain/usecases/load_image_by_collection.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'image_event.dart';
part 'image_state.dart';

@injectable
class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final LoadImageByCollection loadImageByCollection;
  ImageBloc(this.loadImageByCollection)
      : super(const ImageState(imageStateEnum: ImageStateEnum.initial)) {
    on<LoadImageByCollectionEvent>(loadImageEvent);
  }

  FutureOr<void> loadImageEvent(
      LoadImageByCollectionEvent event, Emitter<ImageState> emit) async {
    var res = await loadImageByCollection.call(LoadImageByCollectionParams(
        imageId: event.imageId, nameCollection: event.collectionName,recordId: event.recordId));
    res.fold((failure) => emit(state.failedState('')),
        (fileUrl) => emit(state.loadedState(fileUrl)));
  }
}
