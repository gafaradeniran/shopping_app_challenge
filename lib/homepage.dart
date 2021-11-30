import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/favourite.dart';
import 'package:shopping_app/pages/checkout.dart';
import 'package:shopping_app/pages/dashboard.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final List<Widget> pages = [
    const Homepage(),
    const FavouritePage(),
    const CheckOutPage(),
    const DashboardPage(),
  ];
  final List<IconData> icons = [
    Icons.home_filled,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person_rounded,
  ];
  final List<String> labels = ['Home', 'Favourites', 'Wish List', 'Dashboard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: FittedBox(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? const Color(0xffBA9191)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icons[index],
                          color: const Color(0xffE0B0AC),
                        ),
                        const SizedBox(width: 3),
                        currentIndex == index ? Text(labels[index]) : Center(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
