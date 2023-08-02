import 'package:aumet_trial_products_app/controller/product_controller.dart';
import 'package:aumet_trial_products_app/model/product.dart';
import 'package:aumet_trial_products_app/view/components/product_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends ConsumerState<ProductsScreen> {
  final PagingController<int, Product> _productsListPaginationController =
      PagingController(firstPageKey: 0);
  int _pageSize = 5;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _productsListPaginationController.addPageRequestListener((pageKey) {
      _fetchData();
    });
  }

  Future<void> _fetchData() async {
    List<Product> products = await ref.read(productProvider).getAllProducts(
        _offset,
        _pageSize,
        //on exception
        (e) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e"))));
    _offset += products.length;
    print("in else ");
    _productsListPaginationController.appendPage(products, _offset);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image(
          image: AssetImage("assets/images/aumet_logo.png"),
          height: 300,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: PagedGridView<int, Product>(
            pagingController: _productsListPaginationController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
            ),
            builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, product, index) =>
                    ProductHolder(product: product)),
          ),
        ),
      ),
    );
  }
}
