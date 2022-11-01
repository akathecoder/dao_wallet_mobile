import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
  List<Widget>? actions,
  PreferredSizeWidget? bottom,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    actions: actions,
    bottom: bottom,
  );
}
