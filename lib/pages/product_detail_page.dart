import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoedi/providers/product.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key, required this.productId});

  final String productId;

  final sizes = [37, 38, 39, 40, 41, 42, 43];

  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>().findById(int.parse(productId));

    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.amount}',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: Text(
                '+Add to Chart',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  context.read<Product>().toogleFavorite(product.id);
                },
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: product.isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Détail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/${product.image}'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 25),
                    Text(
                      product.starts.toString(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Text(
              product.miniDescription.toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            Text(
              'Size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ),

            Row(
              children: [
                ...List.generate(sizes.length, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              sizes[index] == product.size
                                  ? Colors.blue
                                  : Colors.grey.withValues(alpha: .3),
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        '${sizes[index]}',
                        style: TextStyle(
                          fontWeight:
                              sizes[index] == product.size
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                          color:
                              sizes[index] == product.size
                                  ? Colors.blue
                                  : Colors.grey.withValues(alpha: .3),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),

            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),

            Text(
              product.description,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
