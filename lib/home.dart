import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradarutest/component/custom_image_network.dart';
import 'package:tradarutest/component/main_app_bar.dart';
import 'package:tradarutest/component/segmented_button.dart';
import 'package:tradarutest/detail.dart';
import 'package:tradarutest/model/cart.dart';

import 'component/model/item_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var listVegetable = [
    Cart("Kangkung", 3.0, "Sayuran segardari kebun pada", 5000),
    Cart("Kangkung", 3.0, "Sayuran segardari kebun pada", 5000),
    Cart("Kangkung", 3.0, "Sayuran segardari kebun pada", 5000)
  ];
  var listFruit = [
    Cart("Jambu", 4.0, "Sayuran segardari kebun pada", 20000),
    Cart("Jambu", 4.0, "Sayuran segardari kebun pada", 20000),
    Cart("Jambu", 4.0, "Sayuran segardari kebun pada", 20000)
  ];
  var listHorti = [
    Cart("Bawang Merah", 5.0, "Sayuran segardari kebun pada", 17000),
    Cart("Bawang Merah", 5.0, "Sayuran segardari kebun pada", 17000),
    Cart("Bawang Merah", 5.0, "Sayuran segardari kebun pada", 17000)
  ];

  var selectedList = List<Cart>();

  @override
  Widget build(BuildContext context) {

    selectedList = listVegetable;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: MainAppBar(
        preferredSize: Size.fromHeight(50),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.only(left: 8, top: 20),
            child: Text("Produk Kami",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(padding: EdgeInsets.all(5),
            child: SegmentedButton(
              items: [
                ItemModel("Sayur"),
                ItemModel("Buah"),
                ItemModel("Holtikul"),
              ],
              onSelected: (i) {
                setState(() {
                  print(i);
                  switch(i) {
                    case 0 : this.selectedList = listVegetable;
                      break;
                    case 1 : this.selectedList = listFruit;
                      break;
                    case 2 : this.selectedList = listHorti;
                      break;
                  }
                });
              },
            ),
          ),
          GridView.count(crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 4/5,
            physics: NeverScrollableScrollPhysics(),
            children: this.selectedList.map((e) =>
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailPage.routeName,
                      arguments: e
                    );
                  },
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomImageNetwork(),
                          Text(e.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text("Rp. ${e.price.toString()}",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(e.rating.toString(),
                                  style: TextStyle(
                                      fontSize: 11
                                  ),
                                ),
                                SvgPicture.asset("assets/star.svg", width: 11, height: 11)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            ).toList(),
          )
        ],
      ),
    );
  }
}