import 'package:get/get.dart';
import 'package:sigap_mobile/core/database/get_storage.dart';
import 'package:sigap_mobile/data/model/account.dart';
import 'package:sigap_mobile/presentation/routes/app_routename.dart';

class HomeController extends GetxController {
  final account = Rxn<Account?>();
  RxString name = "".obs;
  RxString email = "".obs;

  getAccountFromDB() {
    if (getxStorage.accountBox.getValues() != null) {
      account.value = getxStorage.getAccount();
      name.value = account.value!.name!;
      email.value = account.value!.email!;
    }
  }

  logout() {
    getxStorage.clearAccountValue();
    Get.offAllNamed(RouteName.SIGN_IN);
  }
}
