import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ButtonLogin extends StatelessWidget {
  SupabaseClient supabase = Supabase.instance.client;
  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
        onPressed: () async {
          final rawNonce = _generateRandomString();
          final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

          /// TODO: update the client ID with your own
          ///
          /// Client ID that you registered with Google Cloud.
          /// You will have two different values for iOS and Android.
          const clientId =
              '806295959996-comsq0q9jrgvfi3ipe7nl7grafqqgm1d.apps.googleusercontent.com';

          /// reverse DNS form of the client ID + `:/` is set as the redirect URL
          final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

          /// Fixed value for google login
          const discoveryUrl =
              'https://accounts.google.com/.well-known/openid-configuration';

          final appAuth = FlutterAppAuth();

          // authorize the user by opening the concent page
          final result = await appAuth.authorize(
            AuthorizationRequest(
              clientId,
              redirectUrl,
              discoveryUrl: discoveryUrl,
              nonce: hashedNonce,
              scopes: [
                'openid',
                'email',
              ],
            ),
          );

          if (result == null) {
            throw 'No result';
          }

          // Request the access and id token to google
          final tokenResult = await appAuth.token(
            TokenRequest(
              clientId,
              redirectUrl,
              authorizationCode: result.authorizationCode,
              discoveryUrl: discoveryUrl,
              codeVerifier: result.codeVerifier,
              nonce: result.nonce,
              scopes: [
                'openid',
                'email',
              ],
            ),
          );

          final idToken = tokenResult?.idToken;

          if (idToken == null) {
            throw 'No idToken';
          }

          supabase.auth.signInWithIdToken(
            provider: Provider.google,
            idToken: idToken,
            nonce: rawNonce,
          );
        },
        child: Text('data'));
  }
}

/// Function to generate a random 16 character string.

