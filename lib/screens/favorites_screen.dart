import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../services/api_service.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          if (authProvider.user == null) {
            return Center(child: Text('Please log in to view favorites'));
          }

          return FutureBuilder<List<Product>>(
            future: _apiService.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                final allProducts = snapshot.data!;
                final favoriteProducts = allProducts
                    .where((product) =>
                        authProvider.isFavorite(product.id.toString()))
                    .toList();

                if (favoriteProducts.isEmpty) {
                  return Center(child: Text('No favorite products yet'));
                }

                return GridView.builder(
                  padding: EdgeInsets.all(8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: favoriteProducts[index],
                      onTap: () {},
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
