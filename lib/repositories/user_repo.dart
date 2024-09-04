import 'package:nanny_vanny/services/constants.dart';
import 'package:get/get.dart';
import 'package:nanny_vanny/controller/data/api/api_client.dart';

class UserRepo {
  final ApiClient apiClient ;

  UserRepo({required this.apiClient});

  /// Current Bookings Repo
  Future<Response> currentBookingsRepo() async => await apiClient.getData(
        AppConstants.currentBookingUri,
      );

  /// All Packages Repo
  Future<Response> allPackagesRepo() async => await apiClient.getData(
        AppConstants.allPackagesUri,
      );
}
