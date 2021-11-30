import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductFormat {
  final String name, item_image, description;
  final double price;
  final Color container_color, icon_color;

  ProductFormat({
    required this.name,
    required this.item_image,
    required this.description,
    required this.price,
    required this.container_color,
    required this.icon_color,
  });
}

List<ProductFormat> productDetails = [
  ProductFormat(
    name: 'Ice Cream Cerry',
    item_image: 'assets/purpleicecream.png',
    price: 12,
    container_color: Color(0xffC38F7B),
    icon_color: Colors.yellow,
    description:
        'This is an Ice Cream Cherry, lurem ipsum lurem ipsum lurem ipsum lurem ipsum',
  ),
  ProductFormat(
    name: 'Red Velvet Cream',
    item_image: 'assets/freecream2.jpg',
    price: 16,
    container_color: const Color(0xffF9B296),
    icon_color: Colors.yellow,
    description:
        'Butter Cake Red Velvet coated with light cream choose with red velvet crumble',
  ),
  ProductFormat(
    name: 'Ice Cream ',
    item_image: 'assets/realcream2.png',
    price: 76,
    container_color: const Color(0xC9B90C5D),
    icon_color: Colors.yellow,
    description:
        'Cake spiced with the cream and chocolate, Cake spiced with the cream and chocolate,',
  ),
  ProductFormat(
    name: 'Ice Cream berry',
    item_image: 'assets/creamcone1.jpg',
    price: 28,
    container_color: const Color(0x7C030201),
    icon_color: Colors.yellow,
    description:
        'Cake spiced with the cream and chocolate, Cake spiced with the cream and chocolate,',
  ),
];
