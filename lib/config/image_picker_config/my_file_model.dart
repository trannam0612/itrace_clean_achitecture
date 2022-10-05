import 'dart:typed_data';

class MyFileModel {
  MyFileModel({
    this.path,
    this.bytes,
    required this.fileName,
    this.extension,
  }) : assert(path != null || bytes != null);
  String? path;
  Uint8List? bytes;
  String fileName;
  String? extension;
}
