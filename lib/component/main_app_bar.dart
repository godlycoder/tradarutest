import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  final bool withBackpress;

  const MainAppBar({Key key, this.preferredSize, this.withBackpress = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.all(10),
              child: withBackpress? InkWell(
                onTap: () { Navigator.pop(context); },
                child: Icon(Icons.chevron_left),
              ) : SvgPicture.asset("assets/menu.svg", width: 25, height: 25),
            ),
            Padding(padding: EdgeInsets.all(0),
              child: SvgPicture.asset("assets/vegetarian.svg"),
            ),
            Visibility(
                visible: !withBackpress,
                child: Padding(padding: EdgeInsets.all(10),
                  child: SvgPicture.asset("assets/loupe.svg", width: 25, height: 25),
                )
            )
          ],
        ),
      )
    );
  }

  @override
  // TODO: implement preferredSize
  final Size preferredSize;

}