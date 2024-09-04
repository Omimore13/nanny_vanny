import 'package:flutter/material.dart';

import '../utils/static_method/styles.dart';

class Nav {
  Widget Drawer(ctx) {
    return SafeArea(
      child: ListTileTheme(
        textColor: Colors.white,
        iconColor: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/user.png",
              width: 72,
              height: 72,
            ),
            const SizedBox(height: 12),
            Text(
              "Emily Cyrus",
              style: Sty().mediumText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Clr().primaryColor),
            ),
            const SizedBox(height: 20),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'Home',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'Book A Nanny',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'How It Works',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'Why Nanny Vanny',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'My Bookings',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'My Profile',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Clr().primaryColor,
                height: 0,
                thickness: 0.3,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              onTap: () {},
              title: Text(
                'Support',
                style: Sty().largeText.copyWith(
                      height: 1.2,
                      color: Clr().secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
