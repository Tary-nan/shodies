import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shoedi/pages/home_page.dart';
import 'package:shoedi/pages/product_detail_page.dart';
import 'package:shoedi/providers/product.dart';

void main() {
  // runApp(ShoediApp());
  runApp(
    ChangeNotifierProvider(create: (context) => Product(), child: ShoediApp()),
  );
}

class ShoediApp extends StatelessWidget {
  const ShoediApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'productList',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/product/:id',
          name: 'productDetail',
          builder: (BuildContext context, GoRouterState state) {
            final productId = state.pathParameters['id'];
            return ProductDetailPage(productId: productId!);
          },
        ),
      ],
    ),
  ],
);
