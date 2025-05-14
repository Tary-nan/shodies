import 'package:flutter/material.dart';
import 'package:shoedi/models/products.dart';

class Product extends ChangeNotifier {
  // variable

  /// base data
  ///

  List<ProductModel> _listFavorite = [];
  final List<ProductModel> _searchList = [];

  List<ProductModel> _products = [
    ProductModel(
      id: 1,
      title: 'Nike Air Force',
      image: '1.png',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      id: 2,
      image: '2.png',
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      id: 3,
      image: '3.png',
      title: 'Nike Air Jordan 1',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 4,
      title: 'Nike KD 15',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '1.png',
      id: 5,
      title: 'Nike LeBron 20',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '2.png',
      id: 6,
      title: 'Nike Zoom Freak 4',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '3.png',
      id: 7,
      title: 'Reebok Shaqnosis',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 8,
      title: 'New Balance TWO WXY v3',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '1.png',
      id: 9,
      title: 'Puma Clyde All-Pro',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '2.png',
      id: 10,
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '3.png',
      id: 11,
      title: 'Nike Air Force',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 12,
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
  ];

  final List<ProductModel> _productItem = [
    ProductModel(
      id: 1,
      title: 'Nike Air Force',
      image: '1.png',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      id: 2,
      image: '2.png',
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      id: 3,
      image: '3.png',
      title: 'Nike Air Jordan 1',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 4,
      title: 'Nike KD 15',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '1.png',
      id: 5,
      title: 'Nike LeBron 20',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '2.png',
      id: 6,
      title: 'Nike Zoom Freak 4',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '3.png',
      id: 7,
      title: 'Reebok Shaqnosis',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 8,
      title: 'New Balance TWO WXY v3',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '1.png',
      id: 9,
      title: 'Puma Clyde All-Pro',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '2.png',
      id: 10,
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '3.png',
      id: 11,
      title: 'Nike Air Force',
      miniDescription: "Men's Running Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
    ProductModel(
      image: '4.png',
      id: 12,
      title: 'Nike Air Max',
      miniDescription: "Men's Sport Shoes",
      description:
          "Designed by Bruce Kilgore and introduced in 1982, the Air Force 1 was the first-ever basketball shoe to feature Nike technology, revolutionising the game and sneaker culture forever. Over three decades since its first release, the Air Force 1 remains true to its roots while earning its status as a fashion staple for seasons to come.",
      amount: 150,
      size: 43,
      starts: 4.7,
      catgorie: 'Homme',
    ),
  ];

  List<ProductModel> get products => _products;
  List<ProductModel> get productsFavorite => _listFavorite;
  List<ProductModel> get searchProductList => _searchList;

  // void fetch() {
  //   _searchList = _products;
  //   notifyListeners();
  // }

  void searchProductByName(String name) {
    if (name.isNotEmpty) {
      _products =
          _products
              .where(
                (produ) =>
                    produ.title.toLowerCase().contains(name.toLowerCase()),
              )
              .toList();
      notifyListeners();
      return;
    }
    _products = _productItem;
    notifyListeners();
  }

  ProductModel findById(int productId) {
    final result = _products.firstWhere((product) => product.id == productId);
    return result;
  }

  // List<ProductModel> favoriteOnlyAnOtherMethod() {
  //   return _products.where((product) => product.isFavorite).toList();
  // }

  void favoriteOnly() {
    _listFavorite = _products.where((product) => product.isFavorite).toList();
    notifyListeners();
  }

  void toogleFavorite(int productId) {
    ///
    _products =
        _products
            .map(
              (product) =>
                  product.id == productId
                      ? ProductModel(
                        id: product.id,
                        isFavorite: !product.isFavorite,

                        /// false . true ? false
                        title: product.title,
                        image: product.image,
                        miniDescription: product.miniDescription,
                        description: product.description,
                        amount: product.amount,
                        size: product.size,
                        starts: product.starts,
                        catgorie: product.catgorie,
                      )
                      : product,
            )
            .toList();

    print('isFavorite -- > ${_products.where((x) => x.isFavorite)}');

    notifyListeners();
    favoriteOnly();
  }
}
