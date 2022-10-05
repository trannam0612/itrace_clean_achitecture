import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CachedNetworkImage customCachedNetworkImage(
    {double? width, double? height, required String url}) {
  return CachedNetworkImage(
    imageUrl: url,
    placeholder: (BuildContext context, String url) => const Center(
      child: CupertinoActivityIndicator(),
    ),
    width: width,
    height: height,
    errorWidget: (BuildContext context, String url, dynamic error) =>
        const Center(
      child: Icon(Icons.warning),
    ),
  );
}
