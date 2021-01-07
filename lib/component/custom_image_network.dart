import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageNetwork extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomImageNetwork();

}

class _CustomImageNetwork extends State<CustomImageNetwork> {

  bool _loaded = false;
  var img = Image.network("https://img.pngio.com/guavas-are-rich-in-dietary-fibe"
      "r-they-help-in-digestion-and-to-maintain-good-guava-png-676_370.png");
  var placeholder = SvgPicture.asset("assets/vegetarian.svg", color: Colors.grey[300]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img.image.resolve(ImageConfiguration())
        .addListener(new ImageStreamListener((ImageInfo image, bool synchronousCall) {
      if (mounted) {
        setState(() => _loaded = true);
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: _loaded ? img : placeholder
    );
  }
}