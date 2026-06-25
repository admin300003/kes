import 'package:http/http.dart' as http;

Future<void> fetchPartnerData() async {
  final response = await http.post('https://api.example.com/partner', body: {'id': '123'});
  // Line 60 fixed
}