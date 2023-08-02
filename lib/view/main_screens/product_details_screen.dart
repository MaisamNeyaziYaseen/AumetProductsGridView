import 'package:aumet_trial_products_app/controller/product_controller.dart';
import 'package:aumet_trial_products_app/model/product.dart';
import 'package:aumet_trial_products_app/view/components/details_holder.dart';
import 'package:aumet_trial_products_app/view/components/product_state_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDetailsScreen extends StatelessWidget {
  Product product;

  ProductDetailsScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(product.photoUrl),
                ),
                ProductStateHolder(),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim"),
            ),
            Divider(
              thickness: 1,
            ),
            DetailsHolder(
                title: product.name, content: product.description ?? ""),
            DetailsHolder(
                title: "Retail Price", content: "JOD ${product.price ?? ""}"),
            DetailsHolder(title: "Category", content: product.category),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "JOD ${product.price ?? ""}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 200,
                height: 60,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xff43E3C8))),
                child: Text(
                  "Notify When Available",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff43E3C8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
