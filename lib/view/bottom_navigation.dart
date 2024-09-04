import 'package:flutter/material.dart';
import 'package:nanny_vanny/utils/static_method/styles.dart';
import 'home_screen.dart';

Widget bottomBarLayout(ctx, index,{b=false}) {
  return BottomNavigationBar(
    elevation: 50,
    backgroundColor: Colors.white,
    selectedItemColor: Clr().primaryColor,
    unselectedItemColor: Clr().black,
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    onTap: (i) async {
      switch (i) {
        case 0:
          STM().finishAffinity(ctx, const HomeScreen());
          break;
        case 1:
          STM().finishAffinity(ctx, const HomeScreen());
          break;
        case 2:
          STM().finishAffinity(ctx, const HomeScreen());
          break;
          case 3:
          STM().finishAffinity(ctx, const HomeScreen());
          break;
      }
    },
    items: STM().getBottomList(index,b),
  );
}
