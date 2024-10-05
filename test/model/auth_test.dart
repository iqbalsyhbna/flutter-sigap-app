import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sigap_mobile/data/model/account.dart';

import '../fixture/fixture_reader.dart';

void main() {
  group('Account Model', (){
    Account? account;

    setUp((){
      account = const Account(id: 2, name: "User", email: "user@user.com", username: "user");
    });

    test('''
    fromJson test in acount model 
    and should return a valid model
    ''', () async {
        final Map<String, dynamic> jsonObj = jsonDecode(fixture("account.json"));
        // act
        final result = Account.fromJson(jsonObj);
        // assert
        expect(account, result);
      });


    test('''Should return json 
    when toJson method in accound model was called
    ''', () async {
      // act
      final result = jsonEncode(account?.toJson());
      // assert
      expect(result, fixture("account.json"));
    });

  });
}