class User {
  final String id;
  final String email;
  final String password;
  String? name;
  String? profilePictureUrl;
  Set<String> favorites = {};

  User({
    required this.id,
    required this.email,
    required this.password,
    this.name,
    this.profilePictureUrl,
  });

  void toggleFavorite(String productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
  }

  bool isFavorite(String productId) {
    return favorites.contains(productId);
  }
}
