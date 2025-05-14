import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoedi/providers/product.dart';

class ProductFavorite extends StatelessWidget {
  const ProductFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = context.watch<Product>().productsFavorite;
    // final productList = context.watch<Product>().favoriteOnlyAnOtherMethod();

    return ListView.builder(
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            context.goNamed(
              'productDetail',
              pathParameters: {'id': productList[index].id.toString()},
            );
          },
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/${productList[index].image}'),
          ),
          title: Text(productList[index].title),
          subtitle: Text(productList[index].miniDescription),
          trailing: SizedBox(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(productList[index].starts.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
