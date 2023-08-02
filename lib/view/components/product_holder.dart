import 'package:aumet_trial_products_app/model/product.dart';
import 'package:aumet_trial_products_app/view/main_screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductHolder extends ConsumerWidget {
  Product product;

  ProductHolder({required this.product, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(product: product)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 30),
          ],
        ),
        child: Column(
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Image.network(
              product.photoUrl,
              width: 94,
              height: 82,
            ),
            Text(
              product.description ?? "",
              maxLines: 1,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: product)));
                },
                child: Text("See More"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xff43E3C8), // Background color
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
