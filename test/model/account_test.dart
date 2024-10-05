import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sigap_mobile/data/model/account.dart';
import 'package:sigap_mobile/data/model/auth.dart';

import '../fixture/fixture_reader.dart';

void main() {
  Auth? auth;
  Account? account;

  setUp((){
    account = const Account(id: 2, name: "User", username: "user", email: "user@user.com", );
    auth = Auth(token: "11|FDpEO0dJk3MuNuB2kk7aVbu7jGDxfFBjsUfVsikf", account: account!);
  });

  test('''Should get valid Object
   when fromJson was called
  ''', () async {
    final Map<String, dynamic> jsonObj = jsonDecode(fixture("auth.json"));
    // act
    final result = Auth.fromJson(jsonObj);
    // assert
    expect(auth, result);
  });
}