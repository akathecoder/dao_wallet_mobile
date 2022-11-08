import 'dart:ui';

import 'package:flutter/material.dart';

ClipRRect walletBottomNavigationBar({
  required int currentIndex,
  required void Function(int) onTap,
}) {
  return ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[300],
        backgroundColor: Colors.black.withOpacity(0.2),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Label 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_rounded), label: "Label 2"),
        ],
      ),
    ),
  );
}
