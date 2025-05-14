import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoedi/pages/components/product_favorite.dart';
import 'package:shoedi/pages/components/product_list_content.dart';
import 'package:shoedi/providers/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final productList = context.watch<Product>().products;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'shoedi'.toUpperCase(),
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(radius: 20),
                ],
              ),
              SizedBox(height: 10),

              TextField(
                onChanged: (value) {
                  context.read<Product>().searchProductByName(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,

                  hintText: 'Search shoes',
                ),
              ),
              SizedBox(height: 10),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 120,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.white38,
              //   ),
              // ),
              SizedBox(height: 10),
              Expanded(
                child:
                    [
                      ProductListContent(),
                      ProductFavorite(),
                      Container(),
                    ][currentPageIndex],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.favorite_border_rounded)),
            label: 'Favoris',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.messenger_sharp)),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
