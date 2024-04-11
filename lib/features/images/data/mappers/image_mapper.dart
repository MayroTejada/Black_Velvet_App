extension GetPocketBaseImageUrl on Uri {
  String getImageURl() {
    return origin + path;
  }
}
