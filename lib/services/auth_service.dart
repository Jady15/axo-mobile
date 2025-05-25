import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class AuthService {
  // Leer el archivo JSON y devolver lista de usuarios
  Future<List<Map<String, dynamic>>> _loadUsers() async {
    final String jsonString = await rootBundle.loadString('assets/users.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }

  // Validación de credenciales
  Future<bool> login(String usernameOrEmail, String password) async {
    final users = await _loadUsers();
    return users.any((user) =>
    (user['username'] == usernameOrEmail || user['email'] == usernameOrEmail) && user['password'] == password);
  }
}