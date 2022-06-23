import 'package:cached_network_image/cached_network_image.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_responsive_admin_panel/configs/configs.dart';

@immutable
class AppCustomImage extends StatelessWidget { 
  final String image;
  final double? width;
  final double? height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final String? placeholder; 
  final Widget? child;
  
  const AppCustomImage({
    Key? key,
    required this.image, 
    this.width,
    this.height,
    this.bgColor, 
    this.borderWidth = 0, 
    this.borderColor, 
    this.trBackground = false, 
    this.fit = BoxFit.cover,
    this.isNetwork = true, 
    this.radius = 50, 
    this.borderRadius, 
    this.isShadow = true,
    this.placeholder,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [ 
        Container(
          width: width, 
          height: height,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            boxShadow: [
              if(isShadow) const BoxShadow(
                color: Color(0x44000000),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1)
              ),
            ],
          ),
          child: isNetwork ?
          CachedNetworkImage(
            imageUrl: image,
            placeholder: (context, url) => BlankImageWidget(borderRadius: borderRadius ?? BorderRadius.circular(radius)),
            errorWidget: (context, url, error) => BlankImageWidget(borderRadius: borderRadius ?? BorderRadius.circular(radius)),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(radius),
                image: DecorationImage(
                  image: imageProvider, 
                  fit: fit
                ),
              ),
            ), 
          ) : Image(
            image: AssetImage(image), 
            fit: fit,
          ) 
        ),
        child != null ? Container( 
          width: width, 
          height: height,
          decoration: BoxDecoration( 
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
            boxShadow: [
              if(isShadow) const BoxShadow(
                color: Color(0x44000000),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1)
              ),
            ],
          ), 
        ) : Container(),
        child ?? Container()
      ],
    );
  }
}

class BlankImageWidget extends StatefulWidget { 
  final BorderRadiusGeometry? borderRadius;
  final String? placeholder;
  final BoxFit? fit;

  const BlankImageWidget({ 
    Key? key,  
    this.borderRadius,
    this.placeholder,
    this.fit
  }) : super(key: key);

  @override
  State<BlankImageWidget> createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Center(
        child: SizedBox(
          child: Container( 
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius,
              image: DecorationImage(
                image: AssetImage(widget.placeholder ?? Images.sampeLandscape),
                fit: widget.fit ?? BoxFit.cover
              )
            ),
          ),
        )
      ),
    );
  }
}
