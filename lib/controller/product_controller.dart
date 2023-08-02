import 'dart:async';
import 'package:aumet_trial_products_app/model/product.dart';
import 'package:aumet_trial_products_app/services/api/products_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
    ChangeNotifierProvider<ProductController>((ref) => ProductController());

class ProductController extends ChangeNotifier {
  ProductsApiService _productsApiService = ProductsApiService();
  List<Product> _productsList = [];

  Future<List<Product>> getAllProducts(
      dynamic offset, int limit, Function(Exception e) onException) async {
    Map<String, dynamic> response = await _productsApiService.getAllProducts(
        offset, limit, (e) => onException(e));
    List<dynamic> productsData = response['products'];
    List<Product> productsList = [];

    for (var element in productsData) {
      productsList.add(Product.fromjson(element));
    }
    notifyListeners();

    return _productsList = productsList;
  }

  setProductsList(List<Product> value) => _productsList = value;

  List<Product> get getProductsList => _productsList;
}
