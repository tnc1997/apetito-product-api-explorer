import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;

class AuthenticationNotifier extends ChangeNotifier {
  http.Client? _client;

  http.Client? get client => _client;

  Future<void> signIn(
    String clientId,
    String clientSecret,
  ) async {
    _client?.close();

    _client = await oauth2.clientCredentialsGrant(
      Uri.https(
        'identity.apetito.co.uk',
        '/connect/token',
      ),
      clientId,
      clientSecret,
      scopes: [
        'Products.Read.All',
      ],
    );

    notifyListeners();
  }

  Future<void> signOut() async {
    _client?.close();

    _client = null;

    notifyListeners();
  }
}
