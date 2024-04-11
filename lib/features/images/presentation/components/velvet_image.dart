import 'package:black_velvet_app/features/images/presentation/bloc/image_bloc.dart';
import 'package:black_velvet_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VelvetImage extends StatefulWidget {
  final String collectionId;
  final String imageId;
  final String recordId;
  const VelvetImage(
      {super.key,
      required this.collectionId,
      required this.imageId,
      required this.recordId});

  @override
  State<VelvetImage> createState() => _VelvetImageState();
}

class _VelvetImageState extends State<VelvetImage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageBloc>(
      create: (context) => getIt<ImageBloc>()
        ..add(LoadImageByCollectionEvent(
            imageId: widget.imageId,
            collectionName: widget.collectionId,
            recordId: widget.recordId)),
      child: BlocBuilder<ImageBloc, ImageState>(
        builder: (context, state) {
          if (state.imageStateEnum == ImageStateEnum.loaded) {
            return Image.network(
              cacheHeight: 300,
              cacheWidth: 300,
              loadingBuilder: (context, widget, imageChunk) {
                return widget;
              },
              state.imageUrl ?? '',
              errorBuilder: (context, object, stackTrace) {
                return Text(state.imageUrl ?? '');
              },
            );
          } else {
            return const SizedBox(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
