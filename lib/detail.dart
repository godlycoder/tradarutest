import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tradarutest/model/cart.dart';

import 'component/custom_image_network.dart';
import 'component/main_app_bar.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';

  final Cart cart;

  const DetailPage({Key key, this.cart}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    var model = widget.cart;
    print(model.name);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MainAppBar(
        withBackpress: true,
        preferredSize: Size.fromHeight(50),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: CustomImageNetwork(),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text("Rp. ${model.price.toString()}",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(model.rating.toString(),
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      SvgPicture.asset("assets/star.svg", width: 14, height: 14)
                    ],
                  ),
                ),
                Text(model.desc)
              ],
            ),
          )
        ],
      ),
    );
  }

}