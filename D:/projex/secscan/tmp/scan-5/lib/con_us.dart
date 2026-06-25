import 'dart:convert';
import 'package:http/http.dart' as http;

class ConUsService {
  Future<Map<String, dynamic>> fetchUserData() async {
    final uri = Uri.parse('https://api.example.com/user');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load user data');
    }
  }
}