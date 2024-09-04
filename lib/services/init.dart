import 'dart:developer';
import 'package:get/get.dart';
import 'package:nanny_vanny/controller/current_bookings_controller.dart';
import 'package:nanny_vanny/controller/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/all_packages_controller.dart';
import '../repositories/user_repo.dart';
import 'constants.dart';

class Init {
  initialize() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut<SharedPreferences>(() => sharedPreferences);

    try {
      Get.lazyPut(() => ApiClient(
          appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
      Get.lazyPut(() => UserRepo(apiClient: Get.find()));

      Get.lazyPut(() => CurrentBookingController(userRepo: Get.find()));
      Get.lazyPut(() => AllPackagesController(userRepo: Get.find()));
    } catch (e) {
      log('---- ${e.toString()} ----', name: "ERROR AT initialize()");
    }
  }
}
