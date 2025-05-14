import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoedi/providers/product.dart';

class ProductListContent extends StatelessWidget {
  const ProductListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = context.watch<Product>().products;

    return Column(
      children: [
        SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              return LayoutBuilder(
                builder: (context, constraint) {
                  return GestureDetector(
                    onTap: () {
                      context.goNamed(
                        'productDetail',
                        pathParameters: {
                          'id': productList[index].id.toString(),
                        },
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            height: constraint.minHeight * .5,
                            width: constraint.maxWidth,
                            child: Stack(
                              children: [
                                Container(
                                  width: constraint.maxWidth,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffefefef),
                                  ),
                                  child: Image.asset(
                                    'images/${productList[index].image}',
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<Product>().toogleFavorite(
                                          productList[index].id,
                                        );
                                      },
                                      icon: Icon(
                                        productList[index].isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color:
                                            productList[index].isFavorite
                                                ? Colors.red
                                                : Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productList[index].title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                            ),
                            Text(
                              "Men's Running Shoes",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$150",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
