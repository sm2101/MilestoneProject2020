import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/products.dart';
import '../widgets/product_item.dart';

class ProductsOverveiw extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'CAPSICUM',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0104/1059/0266/products/Organic-Capsicum-Green_large_large_4d3d0dfa-a6b0-4dc2-9eba-f5103e83f97e.jpg?v=1571986261',
    ),
    Product(
      id: 'p2',
      title: 'CAWLLI FLOWER',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://www.1mg.com/hi/patanjali/wp-content/uploads/2018/12/Cauliflower.jpg',
    ),
    Product(
      id: 'p3',
      title: 'LADYFINGER',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://krushikendra.com/image/cache/catalog/Ankur/images-800x800.jpg',
    ),
    Product(
      id: 'p4',
      title: 'TOMATO',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://www.truenews.ng/wp-content/uploads/2019/08/tomatoes_c_Kanawa_Studio-iStock-GettyImages-1163317374-LEDE-702x459.jpg',
    ),
    Product(
      id: 'p2',
      title: 'CAWLLI FLOWER',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://www.1mg.com/hi/patanjali/wp-content/uploads/2018/12/Cauliflower.jpg',
    ),
    Product(
      id: 'p4',
      title: 'TOMATO',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://www.truenews.ng/wp-content/uploads/2019/08/tomatoes_c_Kanawa_Studio-iStock-GettyImages-1163317374-LEDE-702x459.jpg',
    ),
    Product(
      id: 'p1',
      title: 'CAPSICUM',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.shopify.com/s/files/1/0104/1059/0266/products/Organic-Capsicum-Green_large_large_4d3d0dfa-a6b0-4dc2-9eba-f5103e83f97e.jpg?v=1571986261',
    ),
    Product(
      id: 'p3',
      title: 'LADYFINGER',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://krushikendra.com/image/cache/catalog/Ankur/images-800x800.jpg',
    ),
    Product(
      id: 'p4',
      title: 'TOMATO',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://www.truenews.ng/wp-content/uploads/2019/08/tomatoes_c_Kanawa_Studio-iStock-GettyImages-1163317374-LEDE-702x459.jpg',
    ),
    Product(
      id: 'p2',
      title: 'CAWLLI FLOWER',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://www.1mg.com/hi/patanjali/wp-content/uploads/2018/12/Cauliflower.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits N Vegetables Shoping Cart'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].imageUrl,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
