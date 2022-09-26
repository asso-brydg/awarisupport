import 'package:get/get.dart';

import '../../frontend/messenger.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Get.offAll(() => const ChatsScreen());
  }
}
