class Cart {
  final String name;
  final double rating;
  final String desc;
  final int price;
  final String imgUrl;

  Cart(this.name, this.rating, this.desc, this.price, { this.imgUrl = ""});
}