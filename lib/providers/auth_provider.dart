import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;

  User? get user => _user;

  Future<bool> login(String email, String password) async {
    try {
      _user = await _authService.login(email, password);
      notifyListeners();
      return true;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      _user = await _authService.register(email, password);
      notifyListeners();
      return true;
    } catch (e) {
      print('Registration error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    _user = null;
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    if (await _authService.isLoggedIn()) {
      _user = await _authService.getCurrentUser();
      notifyListeners();
    }
  }

  void toggleFavorite(String productId) {
    if (_user != null) {
      _user!.toggleFavorite(productId);
      notifyListeners();
    }
  }

  bool isFavorite(String productId) {
    return _user?.isFavorite(productId) ?? false;
  }
}
