import 'package:test/test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('HTTP request uses HTTPS protocol', () async {
    // Mock the HTTP client to intercept requests
    final client = MockClient((request) async {
      expect(request.url.scheme, equals('https'),
          reason: 'Insecure HTTP connection detected');
      return http.Response('', 200);
    });

    // Replace the HTTP client with the mock
    http.Client = () => client;

    // Call the function that was fixed
    await fetchGalleryData();

    // Verify the request was made with HTTPS
    expect(client.sendCalled, isTrue);
  });
}

class MockClient extends http.BaseClient {
  final Future<http.StreamedResponse> Function(http.BaseRequest) _handler;

  MockClient(this._handler);

  bool sendCalled = false;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    sendCalled = true;
    return _handler(request);
  }
}