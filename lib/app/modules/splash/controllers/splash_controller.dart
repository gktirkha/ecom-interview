import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      3.seconds.delay(() {
        Get.offAllNamed(Routes.DASHBOARD);
      });
    });
    super.onInit();
  }
}
