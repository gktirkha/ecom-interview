import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  initialize() async {
    await GetStorage.init();
    2.seconds.delay(() {
      Get.offAllNamed(Routes.DASHBOARD);
    });
  }
}
