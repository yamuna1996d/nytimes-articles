import 'package:flutter/material.dart';

String NY_API_KEY = "2UPL0kTZKyXwedWGnXHVwAkRP9bJQeH1";

double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

const Color dimBlack = Color(0xff656567);
const grey1 = Color(0xFF0A0A0A);
const grey2 = Color(0xFFEAEAEA);

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

PreferredSizeWidget homeAppBar(
    {Function? leadingIconCallBack,
    Widget? titleWidget,
    Function? buttonCallBack,
    required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.tealAccent,
    leading: GestureDetector(
      onTap: () {
        leadingIconCallBack!.call();
      },
      child: const Icon(Icons.menu),
    ),
    title: titleWidget,
    actions: [
      InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.only(right: 20), child: Icon(Icons.search))),
      GestureDetector(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/three-dots.png",
                color: Colors.white,
                height: 23,
                width: 23,
              ))),
    ],
  );
}
