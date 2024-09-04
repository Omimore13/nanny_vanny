import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanny_vanny/controller/all_packages_controller.dart';
import 'package:nanny_vanny/utils/static_method/styles.dart';
import 'package:nanny_vanny/view/bottom_navigation.dart';
import 'package:nanny_vanny/view/drawer.dart';
import 'package:nanny_vanny/view/reuseable_widgets/custom_button.dart';
import 'package:nanny_vanny/view/reuseable_widgets/package_widget.dart';
import 'package:get/get.dart';

import '../controller/current_bookings_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    Get.find<CurrentBookingController>().currentBookingsApi();
    Get.find<AllPackagesController>().allPackagesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    void _handleMenuButtonPressed() {
      _advancedDrawerController.showDrawer();
    }

    return AdvancedDrawer(
      backdropColor: Colors.white,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 800),
      backdrop: Container(
        color: Clr().borderColor.withOpacity(0.5),
      ),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Nav().Drawer(context),
      child: Scaffold(
        bottomNavigationBar: bottomBarLayout(context, 0),
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IconButton(
                splashColor: Colors.white,
                onPressed: _handleMenuButtonPressed,
                icon: ValueListenableBuilder<AdvancedDrawerValue>(
                  valueListenable: _advancedDrawerController,
                  builder:
                      (BuildContext context, AdvancedDrawerValue value, _) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: SvgPicture.asset(
                        "assets/hamburger.svg",
                        height: 35,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/user.png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome ",
                        style: Sty()
                            .mediumText
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Emily Cyrus",
                        style: Sty().mediumText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Clr().primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Clr().primaryColor.withOpacity(0.5),
                      border: Border.all(
                        color: Clr().borderColor,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    height: 200,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Nanny And\nBabysitting Services",
                            style: Sty().largeText.copyWith(
                                  height: 1.2,
                                  color: Clr().secondaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 100,
                            height: 28,
                            child: CustomButton(
                              splashColor: Colors.black12,
                              type: ButtonType.primary,
                              onTap: () {},
                              radius: 100,
                              child: Text(
                                "Book Now",
                                style: Sty().mediumText.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -30,
                    right: -28,
                    bottom: -36,
                    child: Image.asset(
                      "assets/lady.png",
                      height: 260, // Adjust height as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                "Your Current Booking",
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              GetBuilder<CurrentBookingController>(builder: (booking) {
                var list = booking.currentBookingList;
                return booking.isLoading
                    ? Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Clr().hintColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        width: size.width,
                      )
                    : ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var v = list[index];
                          return Packages().currentPackageLayout(context, v);
                        },
                      );
              }),
              const SizedBox(height: 20),
              Text(
                "Packages",
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 12),
              GetBuilder<AllPackagesController>(builder: (packages) {
                var list = packages.allPackagesList;
                return packages.isLoading
                    ? Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Clr().hintColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        width: size.width,
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        padding: const EdgeInsets.only(bottom: 40),
                        itemBuilder: (context, index) {
                          var v = list[index];
                          return Packages().allPackageLayout(context, index, v);
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
