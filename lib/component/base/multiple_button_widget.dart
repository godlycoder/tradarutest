import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradarutest/component/model/item_model.dart';

abstract class MultipleButtonWidget extends StatefulWidget {
  final List<ItemModel> items;
  final Function onSelected;

  const MultipleButtonWidget(this.items, this.onSelected);
}

abstract class MultipleButtonState<T extends MultipleButtonWidget> extends State<T> {
  List<ItemModel> data = new List<ItemModel>();
  var index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = widget.items;
    setSelected();
  }

  void setSelected() {
    data.forEach((element) { element.isSelected = false; });
    data[index].isSelected = true;
  }

  Widget buildItem(ItemModel model);

  Decoration initDecoration() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: initDecoration(),
      child: Row(
        children: data.map((e) =>
            Expanded(
                child: InkWell(
                  onTap: () => setState(() {
                    index = data.indexOf(e);
                    setSelected();
                    widget.onSelected(index);
                  }),
                  child: buildItem(e),
                )
            )
        ).toList(),
      ),
    );
  }
}

abstract class MultipleItemButton extends StatelessWidget {
  final ItemModel model;

  const MultipleItemButton(this.model);
}