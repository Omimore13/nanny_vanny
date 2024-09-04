import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nanny_vanny/utils/static_method/styles.dart';
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

  @override
  void initState() {
    Get.find<CurrentBookingController>().currentBookingsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              "assets/hamburger.svg",
              height: 35,
              fit: BoxFit.cover,
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
            Packages().packageLayout(context),
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
            ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              padding: const EdgeInsets.only(bottom: 40),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: index % 2 == 0
                        ? Clr().primaryColor.withOpacity(0.5)
                        : const Color(0xff80ABDB),
                    border: Border.all(
                      color: Clr().borderColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              "assets/package_calendar.svg",
                              width: 30,
                              color: index % 2 == 0
                                  ? Clr().primaryColor
                                  : Colors.white,
                            ),
                            SizedBox(
                              width: 100,
                              height: 28,
                              child: CustomButton(
                                color: index % 2 == 0
                                    ? Clr().primaryColor
                                    : Clr().secondaryLightColor,
                                splashColor: Colors.black12,
                                type: ButtonType.primary,
                                onTap: () {},
                                radius: 100,
                                child: Text(
                                  "Book Now",
                                  style: Sty().mediumText.copyWith(
                                        color: Colors.white,
                                        // fontWeight:
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "One Day Package",
                              style: Sty().mediumText.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Clr().secondaryColor),
                            ),
                            Text(
                              "₹ 2799",
                              style: Sty().mediumText.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                  color: Clr().secondaryColor),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam ",
                          style: Sty().smallText.copyWith(
                              height: 1.2, color: const Color(0xff494949)),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
