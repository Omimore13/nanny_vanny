import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/static_method/styles.dart';
import 'custom_button.dart';

class Packages {
  /// Current Booking Layout
  Widget currentPackageLayout(ctx, v) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                Text(
                  // "One Day ",
                  "${v.title}",
                  style: Sty().mediumText.copyWith(
                      fontWeight: FontWeight.w600, color: Clr().primaryColor),
                ),
                SizedBox(
                  width: 100,
                  height: 28,
                  child: CustomButton(
                    color: Clr().primaryColor,
                    splashColor: Colors.black12,
                    type: ButtonType.primary,
                    onTap: () {},
                    radius: 100,
                    child: Text(
                      "Start",
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
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From",
                        style: Sty().microText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Clr().textcolor),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/calendar.svg",
                            width: 12,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${v.fromDate}",
                            style: Sty().mediumText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Clr().textcolor),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/clock.svg",
                            width: 12,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${v.fromTime}",
                            style: Sty().mediumText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Clr().textcolor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To",
                        style: Sty().microText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Clr().textcolor),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/calendar.svg",
                            width: 12,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${v.toDate}",
                            style: Sty().mediumText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Clr().textcolor),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/clock.svg",
                            width: 12,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${v.toTime}",
                            style: Sty().mediumText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Clr().textcolor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                  width: 85,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Clr().secondaryColor,
                        padding: EdgeInsets.zero,
                        surfaceTintColor: Clr().primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          "Rate Us",
                          style: Sty().smallText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  height: 28,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Clr().secondaryColor,
                        padding: EdgeInsets.zero,
                        surfaceTintColor: Clr().primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Geolocation",
                          style: Sty().smallText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  height: 28,
                  width: 98,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Clr().secondaryColor,
                        padding: EdgeInsets.zero,
                        surfaceTintColor: Clr().primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/radio.svg"),
                        const SizedBox(width: 4),
                        Text(
                          "Survillence",
                          style: Sty().smallText.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }

  Widget allPackageLayout(ctx, index, v) {
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
                  color: index % 2 == 0 ? Clr().primaryColor : Colors.white,
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
                  // "One Day Package",
                  "${v.title ?? ''}",
                  style: Sty().mediumText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Clr().secondaryColor),
                ),
                Text(
                  "₹ ${v.price ?? '0'}",
                  style: Sty().mediumText.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Clr().secondaryColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              v.desc ?? "",
              maxLines: 2,
              style: Sty().smallText.copyWith(
                  height: 1.2,
                  overflow: TextOverflow.ellipsis,
                  color: const Color(0xff494949)),
            )
          ],
        ),
      ),
    );
  }
}
