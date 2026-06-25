import 'package:http/http.dart' as http;

// ... other imports and code ...

Future<void> fetchGalleryData() async {
  final url = 'https://example.com/gallery'; // Changed from HTTP to HTTPS
  final response = await http.get(Uri.parse(url));
  // ... rest of the function ...
}