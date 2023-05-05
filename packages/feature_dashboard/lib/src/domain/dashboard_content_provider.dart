import 'package:flutter/material.dart';

abstract class DashboardContentProvider {
  List<BottomNavigationBarItem> getNavigationBarItems();
  List<Widget> getContents();
}