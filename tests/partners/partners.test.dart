import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:kes/lib/partners.dart';

void main() {
  test('uses HTTPS for partner data fetch', () async {
    final mockPost = mockFunc();
    await fetchPartnerData();
    expect(mockPost.calledWith('https://api.example.com/partner'), isTrue);
  });
}