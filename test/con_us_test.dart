import 'package:test/test.dart'
import 'package:http/testing.dart'
import 'package:http/http.dart' as http
import 'package:your_package/con_us.dart'

void main() {
  group('ConUsService', () {
    test('fetchUserData uses HTTPS URL', () async {
      final mockClient = MockClient((request) async {
        expect(request.url.toString(), startsWith('https://'));
        return http.Response('{"id":1,"name":"test"}', 200);
      })
      final service = ConUsService()
      // Inject mock client if service allows, otherwise rely on overriding http.get
      // For simplicity, we assume service uses the top-level http.get which we can mock:
      http.BaseClient originalClient = http.Client
      http.Client = mockClient
      try {
        final result = await service.fetchUserData()
        expect(result, isNotNull)
        expect(result['id'], 1)
      } finally {
        http.Client = originalClient
      }
    })
  })
}