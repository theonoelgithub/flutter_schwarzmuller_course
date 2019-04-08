import 'package:flutter/material.dart';
import './pages/product.dart';


class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct}) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator
                  .pushNamed<bool>(context, '/product/$index')
                  .then((bool value) {
                    if (value) {
                      deleteProduct(index);
                    }
                  }),
              )
              ],
            alignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  Widget buildProductsList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCards = Center(
        child: Text('No products found, please add some'),
      );
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build()');
    return buildProductsList();
  }
}
