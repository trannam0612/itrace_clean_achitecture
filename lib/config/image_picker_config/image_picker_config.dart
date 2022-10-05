import 'dart:developer';
import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itrace_247/config/image_picker_config/my_file_model.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class AppImagePicker {
  // static final AppImagePicker _singleton = AppImagePicker._internal();

  // factory AppImagePicker() {
  //   return _singleton;
  // }

  // AppImagePicker._internal();

  final ImagePicker _picker = ImagePicker();

  Future<MyFileModel?> pickImage(BuildContext context) async {
    MyFileModel? pickedFile;

    File? file = await _pickPhoneImage(context);
    if (file != null) {
      pickedFile = MyFileModel(
        path: file.path,
        fileName: file.path.split('/').last,
        extension: file.path.split('/').last.split('.').last,
        bytes: File(file.path).readAsBytesSync(),
      );
    }
    log('pickedFile:${pickedFile?.path ?? ''}');
    return pickedFile;
  }

  // Future<List<MyFileModel>> pickMultiImage() async {
  //   List<MyFileModel> pickedFileList = [];
  //   FilePickerResult? pickedPlatformFile = await _pickViaFilePicker(
  //     allowMultiple: true,
  //   );
  //   if (pickedPlatformFile != null) {
  //     if (kIsWeb) {
  //       pickedFileList = pickedPlatformFile.files
  //           .map(
  //             (file) => MyFileModel(
  //               fileName: file.name,
  //               extension: file.extension,
  //               bytes: file.bytes,
  //             ),
  //           )
  //           .toList();
  //     } else {
  //       List<File> convertedList = [];
  //       for (var file in pickedPlatformFile.files) {
  //         final webpImage = await _convertToWebp(File(file.path!));
  //         if (webpImage != null) {
  //           convertedList.add(webpImage);
  //         }
  //       }
  //       print('convertedList:${convertedList.length}');
  //       pickedFileList = convertedList
  //           .map(
  //             (file) => MyFileModel(
  //               path: file.path,
  //               fileName: file.path.split('/').last,
  //               extension: file.path.split('/').last.split('.').last,
  //               bytes: File(file.path).readAsBytesSync(),
  //             ),
  //           )
  //           .toList();
  //     }
  //   }
  //   return pickedFileList;
  // }
  // Future<FilePickerResult?> _pickViaFilePicker({
  //   bool allowMultiple = false,
  // }) async {
  //   FilePickerResult? pickedPlatformFile = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //     allowMultiple: allowMultiple,
  //   );
  //   return pickedPlatformFile;
  // }

  // // Future<List<File>> _pickMultiWebpImage() async {
  // //   List<XFile>? pickedFiles = await _picker.pickMultiImage();
  // //   List<File> convertedList = [];
  // //   if (pickedFiles != null) {
  // //     for (var image in pickedFiles) {
  // //       final webpImage = await _convertToWebp(File(image.path));
  // //       if (webpImage != null) {
  // //         convertedList.add(webpImage);
  // //       }
  // //     }
  // //   }
  // //   return convertedList;
  // // }
  // Future<File?> _convertToWebp(File file) async {
  //   // /data/user/0/com.estate.landvina.landvina_v2/cache/image_picker3020371459855739643.jpg
  //   // /data/user/0/com.estate.landvina.landvina_v2/cache/image_picker3020371459855739643.webp
  //   String filePath = file.absolute.path;
  //   String parentPath = filePath.substring(0, filePath.lastIndexOf('/'));
  //   String fileName = filePath.split('/').last.split('.').first;
  //   String targetPath = '$parentPath/$fileName.webp';
  //   File? result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 68,
  //     format: CompressFormat.webp,
  //   );
  //   return result;
  // }

  Future<File?> _pickPhoneImage(BuildContext context) async {
    File? pickedImage;
    bool? isGallery = await _showImagePickerBottomSheet(context);
    if (isGallery != null) {
      if (isGallery) {
        pickedImage = await _pickWebpImage(ImageSource.gallery);
      } else {
        pickedImage = await _pickWebpImage(ImageSource.camera);
      }
    }
    return pickedImage;
  }

  Future<File?> _pickWebpImage(ImageSource source) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
      // preferredCameraDevice: CameraDevice.front,
    );
    File? file;
    if (pickedFile != null) {
      file = File(pickedFile.path);
    }
    return file;
  }

  Future<bool?> _showImagePickerBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.w),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext builder) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 40.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.w),
              topRight: Radius.circular(16.w),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(SvgAssets.icCancel),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context, false),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(SvgAssets.icCamera),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'Chụp ảnh mới',
                      style: StylesConstant.ts16w500.copyWith(
                        color: ColorsConstant.c04142C,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context, true),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(SvgAssets.icLibrary),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      'Chọn từ thư viện ảnh',
                      style: StylesConstant.ts16w500.copyWith(
                        color: ColorsConstant.c04142C,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
