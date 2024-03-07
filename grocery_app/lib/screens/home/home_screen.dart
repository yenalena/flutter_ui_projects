import 'package:flutter/material.dart';
import 'package:grocery_app/constants.dart';
import 'package:grocery_app/models/Product.dart';
import 'package:grocery_app/screens/home/components/home_header.dart';
import 'package:grocery_app/screens/home/components/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: const Color(0xFFEAEAEA),
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              return Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    height: headerHeight,
                    child: const HomeHeader(),
                  ),
                  Positioned(
                    top: headerHeight,
                    left: 0,
                    right: 0,
                    height:
                        constraints.maxHeight - headerHeight - cartBarHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(defaultPadding * 1.5),
                          bottomRight: Radius.circular(defaultPadding * 1.5),
                        ),
                      ),
                      child: GridView.builder(
                        itemCount: demo_products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                        ),
                        itemBuilder: (context, index) => ProductCard(
                          product: demo_products[index],
                          press: () {},
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {},
                      child: Container(
                        height: cartBarHeight,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
