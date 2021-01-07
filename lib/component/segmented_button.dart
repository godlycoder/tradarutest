import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'base/multiple_button_widget.dart';
import 'model/item_model.dart';

class SegmentedButton extends MultipleButtonWidget {


  SegmentedButton({List<ItemModel> items, Function onSelected})
      : super(items, onSelected);

  @override
  State<StatefulWidget> createState() => _SegmentedButton();
}

class _SegmentedButton extends MultipleButtonState<SegmentedButton> {
  @override
  Widget buildItem(ItemModel model) => _ItemButton(model);

  @override
  Decoration initDecoration() {
    // TODO: implement initDecoration
    return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20)
    );
  }
}

class _ItemButton extends MultipleItemButton {

  _ItemButton(ItemModel model) : super(model);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: model.isSelected ? Colors.green : Colors.white,
        ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(model != null ? model.text : "",
            style: TextStyle(
              color: model.isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}