import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import '../models/user.dart';

class AuthService extends ChangeNotifier {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
  static const _userKey = 'user_data';

  String? _error;
  bool _isLoading = false;

  String? get error => _error;
  bool get isLoading => _isLoading;

  // Синглтон
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _setError(null);
      _setLoading(true);

      // TODO: Реализовать запрос к API для входа
      // Временно используем моковые данные
      await Future.delayed(const Duration(seconds: 1)); // Имитация запроса
      
      final token = 'test_token';
      final userData = {
        'id': 1,
        'username': 'user',
        'email': email,
      };

      await _storage.write(key: _tokenKey, value: token);
      await _storage.write(key: _userKey, value: json.encode(userData));
      
      return true;
    } catch (e) {
      _setError('Не удалось войти: ${e.toString()}');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signUp(String email, String password) async {
    try {
      _setError(null);
      _setLoading(true);

      // TODO: Реализовать запрос к API для регистрации
      await Future.delayed(const Duration(seconds: 1)); // Имитация запроса
      await signIn(email, password);
      
      return true;
    } catch (e) {
      _setError('Не удалось зарегистрироваться: ${e.toString()}');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      _setError(null);
      _setLoading(true);

      // TODO: Реализовать запрос к API для сброса пароля
      await Future.delayed(const Duration(seconds: 1)); // Имитация запроса
      
      return true;
    } catch (e) {
      _setError('Не удалось отправить инструкции: ${e.toString()}');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _setError(null);
    _setLoading(true);
    try {
      await _storage.deleteAll();
    } catch (e) {
      _setError('Не удалось выйти: ${e.toString()}');
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final token = await _storage.read(key: _tokenKey);
      return token != null;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final userData = await _storage.read(key: _userKey);
      if (userData == null) return null;

      final Map<String, dynamic> data = json.decode(userData);
      return User.fromJson(data);
    } catch (e) {
      _setError('Не удалось получить данные пользователя: ${e.toString()}');
      return null;
    }
  }
}
