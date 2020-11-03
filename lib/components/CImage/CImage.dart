import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CImage extends StatelessWidget {
  CImage({
    @required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
  });
  final double width;
  final double height;
  final String imageUrl;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return imageUrl == null
        ? Container(
            color: Colors.grey,
            child: Center(
                child: Text(
              "No Images available",
              style: TextStyle(fontFamily: "poppins"),
            )),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                borderRadius: borderRadius,
              ),
            ),
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                strokeWidth: 1.2,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          );
  }
}
