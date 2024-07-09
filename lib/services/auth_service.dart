import 'dart:convert';
import '../models/user.dart';
import 'token_service.dart';

class AuthService {
  final TokenService _tokenService = TokenService();
  final Map<String, User> _users = {};

  Future<User?> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (_users.containsKey(email) && _users[email]!.password == password) {
      final user = _users[email]!;
      await _tokenService.saveToken('mock_token_${user.id}');
      return user;
    } else {
      throw Exception('Invalid credentials');
    }
  }

  Future<User?> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (_users.containsKey(email)) {
      throw Exception('User already exists');
    }
    final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        email: email,
        password: password);
    _users[email] = user;
    await _tokenService.saveToken('mock_token_${user.id}');
    return user;
  }

  Future<void> logout() async {
    await _tokenService.deleteToken();
  }

  Future<bool> isLoggedIn() async {
    return await _tokenService.isTokenValid();
  }

  Future<User?> getCurrentUser() async {
    final token = await _tokenService.getToken();
    if (token == null) return null;

    final userId = token.split('_').last;
    return _users.values.firstWhere((user) => user.id == userId);
  }
}
