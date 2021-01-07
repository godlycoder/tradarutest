class ItemModel<T> {
  bool isSelected = false;
  final String text;
  final T value;

  ItemModel(this.text, {this.value});
}