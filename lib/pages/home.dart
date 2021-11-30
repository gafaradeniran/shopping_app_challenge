// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopping_app/productformat/itemsformat.dart';
import 'package:shopping_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/productscreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  final List<String> _tabs = ['Popular', 'Ice cream', 'Butter cake'];
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 0.0),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's,\nEat Desert Food",
                  style: bodyStyle,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/me.jpg'),
                  radius: 30,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              enableInteractiveSelection: false,
              enabled: false,
              autofocus: false,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 26,
                ),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Recomended',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Row(
                  children: [
                    const Text('View All'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  productDetails.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductScreen(index: index),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            height: 220,
                            width: 200,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: 200,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color:
                                        productDetails[index].container_color,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(height: 50),
                                      SizedBox(
                                        height: 25,
                                        child: RatingBar.builder(
                                          itemSize: 20.0,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        productDetails[index].name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${productDetails[index].price}',
                                            style: priceStyle,
                                          ),
                                          const CircleAvatar(
                                            backgroundColor: Colors.yellow,
                                            radius: 15,
                                            child: Icon(
                                              Icons.favorite_border_rounded,
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                productDetails[index].item_image,
                                height: 120,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 120),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    _tabs.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = index;
                          _pageController.jumpToPage(index);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              _tabs[index],
                              style: GoogleFonts.poppins(
                                color: Color(0xffC38F7B),
                                fontSize: 18,
                                fontWeight: _selectedTab == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                          _selectedTab == index
                              ? Container(
                                  height: 2,
                                  width: 53,
                                  color: const Color(0xffC38F7B),
                                )
                              : const Center(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 90,
                    child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _selectedTab = index;
                        });
                      },
                      children: [
                        Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage('assets/realcream1.png'),
                                radius: 35,
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Waffle Sliced Banana',
                                      style: bodyStyle),
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
                                  Text('\$16', style: priceStyle),
                                ],
                              ),
                              const SizedBox(width: 12),
                              const Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: Colors.yellow,
                                  radius: 15,
                                  child: Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(' This is the ice cream page'),
                        Text(' This is the Buttercake page'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
