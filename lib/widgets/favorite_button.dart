import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/auth_provider.dart';

class FavoriteButton extends StatelessWidget {
  final Product product;

  const FavoriteButton({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final isFavorite = authProvider.isFavorite(product.id.toString());
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () {
            authProvider.toggleFavorite(product.id.toString());
          },
        );
      },
    );
  }
}
