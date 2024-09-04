import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nanny_vanny/model/packages_model.dart';
import '../model/response_model.dart';
import '../repositories/user_repo.dart';
import '../services/constants.dart';

class AllPackagesController extends GetxController implements GetxService {
  final UserRepo userRepo;

  AllPackagesController({required this.userRepo});

  List<PackagesModel> allPackagesList = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<ResponseModel> allPackagesApi() async {
    ResponseModel responseModel;
    log("response.body.toString()${AppConstants.baseUrl}${AppConstants.allPackagesUri}",
        name: "All Packages");
    _isLoading = true;
    update();
    try {
      Response response = await userRepo.allPackagesRepo();
      log(response.statusCode.toString());
      log("Response ::: ${response.body.toString()}");
      if (response.statusCode == 200) {
        log(jsonEncode(response.body), name: "string_data");
        allPackagesList =
            packagesModelFromJson(jsonEncode(response.body['response']));
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
          name: "ERROR AT allPackagesApi()");
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
