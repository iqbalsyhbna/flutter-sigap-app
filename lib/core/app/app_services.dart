import 'package:get/get.dart';
import 'package:sigap_mobile/core/database/get_storage.dart';
import 'package:sigap_mobile/core/network/api_config.dart';

class AppServices extends GetxService{
  static initServices() async {
    Get.put(GetxStorageManager());
    Get.lazyPut(() => DioClientServices());
  }
}

