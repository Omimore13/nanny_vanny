import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import '../model/current_booking_model.dart';
import '../model/response_model.dart';
import '../repositories/user_repo.dart';
import '../services/constants.dart';

class CurrentBookingController extends GetxController implements GetxService {
  final UserRepo userRepo;

  CurrentBookingController({required this.userRepo});

  List<CurrentBookingModel> currentBookingList = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> currentBookingsApi() async {
    ResponseModel responseModel;
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.currentBookingUri}",
        name: "Current Booking");
    _isLoading = true;
    update();
    try {
      Response response = await userRepo.currentBookingsRepo();
      log(response.statusCode.toString());
      log("Response ::: ${response.body.toString()}");
      if (response.statusCode == 200) {
        log(jsonEncode(response.body), name: "string_data");
        currentBookingList =
            currentBookingModelFromJson(jsonEncode(response.body['response']));
        if (response.body.containsKey('errors')) {
          _isLoading = false;
          update();
          return ResponseModel(
              false, response.statusText!, response.body['errors']);
        }
        update();
        responseModel =
            ResponseModel(true, '${response.body['message']}', response.body);
      } else {
        responseModel = ResponseModel(
          false,
          '${response.body['message']}',
        );
      }
    } catch (e) {
      responseModel = ResponseModel(false, "CATCH");
      log('++++++++++++++ ${e.toString()} ++++++++++++++',
          name: "ERROR AT currentBookingsApi()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
