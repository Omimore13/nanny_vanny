import 'package:nanny_vanny/services/constants.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/controller/data/api/api_client.dart';

class UserRepo {
  final ApiClient apiClient ;

  UserRepo({required this.apiClient});

  /// All Mutual Funds Repo
  Future<Response> currentBookingsRepo() async => await apiClient.getData(
        AppConstants.currentBookingUri,
      );
}
