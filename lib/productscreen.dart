// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopping_app/productformat/itemsformat.dart';
import 'package:shopping_app/styles.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductScreen extends StatefulWidget {
  final int index;
  const ProductScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  //height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          //width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  productDetails[widget.index].item_image),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                productDetails[widget.index].name,
                                style: bodyStyle,
                              ),
                              RatingBar.builder(
                                itemSize: 20.0,
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(height: 15),
                              Wrap(children: [
                                Text(
                                  productDetails[widget.index].description,
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 14),
                                )
                              ]),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity == 1) {
                                            quantity = 1;
                                          } else {
                                            quantity -= 1;
                                          }
                                        });
                                      },
                                      child: const Text(
                                        ' — ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      '$quantity',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (quantity == '1') {
                                            quantity = 1;
                                          } else {
                                            quantity += 1;
                                          }
                                        });
                                      },
                                      child: const Text(
                                        ' + ',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'Detail Price',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: 340,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xffE0B0AC),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Price',
                              style: rowStyle,
                            ),
                            Text(
                              '\$32',
                              style: rowStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shopping Charges',
                              style: rowStyle,
                            ),
                            Text(
                              '\$2',
                              style: rowStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: rowStyle,
                            ),
                            Text(
                              '\$35',
                              style: rowStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Order Now',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Color(0xffC38F7B),
                  minWidth: double.infinity,
                  height: 45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
