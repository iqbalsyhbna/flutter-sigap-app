import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sigap_mobile/data/model/account.dart';

enum KeyBox {
  myKey,
  account,
  token,
}

final GetxStorageManager getxStorage = Get.find<GetxStorageManager>();

class GetxStorageManager {
  // final myBox = GetStorage("myBox");
  final accountBox = GetStorage("accountBox");
  final credentialBox = GetStorage("credentialBox");

  // -------<Your Manage Storage>-------
  // void saveValue(String token) async => await myBox.write(KeyStorage.myKey.toString(), token);
  // String? getValue() => myBox.read(KeyStorage.myKey.toString());
  // bool isEmptyBox() => (myBox.read(KeyStorage.myKey.toString()) == null);
  // void clearMyBoxValue() => myBox.remove(KeyStorage.myKey.toString());
  // void clearMyBox() => myBox.erase();


  // -------<Credential Storage>-------
  void saveToken(String token) => credentialBox.writeInMemory(KeyBox.token.toString(), token);
  void getToken()=> credentialBox.read(KeyBox.token.toString());
  bool isLoggedIn() => credentialBox.hasData(KeyBox.token.toString());

  // -------<Account Storage>-------
  void saveAccount(Account account) => accountBox.write(KeyBox.account.toString(), account);
  Account getAccount() => accountBox.read(KeyBox.account.toString());
  void clearAccountValue() => accountBox.remove(KeyBox.account.toString());
  void clearAccountBox() => accountBox.erase();

  Future logout() async {
    await accountBox.erase();
    await credentialBox.erase();
  }

  // Shared functionality
  void clearTempDB() {
    try {
      if (credentialBox.hasData(KeyBox.token.toString())) credentialBox.remove(KeyBox.token.toString());
      if (accountBox.hasData(KeyBox.account.toString())) accountBox.remove(KeyBox.account.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clearAllBox() {
    try {
      credentialBox.erase();
      accountBox.erase();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
