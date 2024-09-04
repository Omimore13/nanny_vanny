import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class Sty {
  TextStyle microText = TextStyle(
    fontFamily: "Alegreya",
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 12.0,
  );
  TextStyle smallText = TextStyle(
    fontFamily: "Alegreya",
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 14.0,
  );
  TextStyle mediumText = TextStyle(
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
    fontFamily: "Alegreya",
  );
  TextStyle mediumBoldText = TextStyle(
    fontFamily: "Alegreya",
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle largeText = TextStyle(
    fontFamily: "Alegreya",
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );
  TextStyle extraLargeText = TextStyle(
    fontFamily: "Alegreya",
    letterSpacing: 0.5,
    color: Clr().textcolor,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
  );

  InputDecoration textFieldOutlineStyle = InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Clr().formBorder,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Clr().primaryColor,
      ),
    ),
  );
}

class Clr {
  Color primaryColor = const Color(0xffE36DA6);
  Color secondaryColor = const Color(0xff262F71);
  Color secondaryLightColor = const Color(0xff0098D0);
  Color greenColor = const Color(0xff0BCE83);
  Color textcolor = const Color(0xFF5C5C5C);
  Color textSecondary = const Color(0xFF9586A8);
  Color black = const Color(0xFF000000);
  Color shimmerColor = const Color(0xFFABABAB);
  Color formBorder = const Color(0xFFD9D0E3);
  Color red = const Color(0xFFFF0000);
  Color borderColor = const Color(0xFFf3f3f3);
  Color hintColor = const Color(0xFF949494);
  Color grey = const Color(0xFF939097);
}

class STM {
  Future<bool> checkInternet(context, widget) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else {
      internetAlert(context, widget);
      return false;
    }
  }

  internetAlert(context, widget) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // SizedBox(child: Lottie.asset('assets/no_internet_alert.json')),
            Text(
              'Connection Error',
              style: Sty().largeText.copyWith(
                    color: Clr().primaryColor,
                    fontSize: 18.0,
                  ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'No Internet connection found.',
              style: Sty().smallText,
            ),
            SizedBox(
              height: 32,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                ),
                onPressed: () async {
                  var connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.mobile ||
                      connectivityResult == ConnectivityResult.wifi) {
                    Navigator.pop(context);
                    STM().replacePage(context, widget);
                  }
                },
                child: Text(
                  "Try Again",
                  style: Sty().largeText.copyWith(
                        color: Colors.white,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ).show();
  }

  void redirect2page(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  void replacePage(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
    );
  }

  void back2Previous(BuildContext context) {
    Navigator.pop(context);
  }

  //
  // void displayToast(String string) {
  //   Fluttertoast.showToast(
  //     msg: string,
  //     toastLength: Toast.LENGTH_SHORT,
  //   );
  // }

  void finishAffinity(final BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
  }
}
