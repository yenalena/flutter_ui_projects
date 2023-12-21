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
          color: Color(0xFFEAEAEA),
          child: Column(
            children: [
              HomeHeader(),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
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
              SizedBox(
                height: cartBarHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
