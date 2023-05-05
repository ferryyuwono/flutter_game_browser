import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DashboardContentProvider)
class DashboardContentProviderImpl implements DashboardContentProvider {
  @override
  List<Widget> getContents() {
    return const [
      GameList(),
      Center(
        child: Icon(
          Icons.camera,
          size: 150,
          color: Colors.white,
        ),
      ),
      Center(
        child: Icon(
          Icons.chat,
          size: 150,
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  List<BottomNavigationBarItem> getNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'Games',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.camera),
        label: 'Camera',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: 'Chats',
      ),
    ];
  }
}