import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:get_it/get_it.dart';

class DashboardPage extends StatefulWidget {
  static const String screenKey = 'screen.dashboard';
  static const String bodyLoadingKey = 'screen.dashboard.body.loading';
  static const String bodyListGameKey = 'screen.dashboard.body.list.game';

  const DashboardPage() : super(key: const Key(DashboardPage.screenKey));

  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  late final DashboardBloc dashboardBloc = GetIt.instance.get<DashboardBloc>();
  late final DashboardContentProvider dashboardContentProvider = GetIt.instance.get<DashboardContentProvider>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>.value(
      value: dashboardBloc,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Playstation 5 Games Browser"),
        ),
        body: SafeArea(
          child: BlocSelector<DashboardBloc, DashboardState, int>(
            selector: (state) => state.selectedBottomNavigationIndex,
            builder: (context, state) {
              return IndexedStack(
                index: state,
                children: dashboardContentProvider.getContents(),
              );
            }
          ),
        ),
        bottomNavigationBar: BlocSelector<DashboardBloc, DashboardState, int>(
          selector: (state) => state.selectedBottomNavigationIndex,
          builder: (context, state) {
            return BottomNavigationBar(
              items: dashboardContentProvider.getNavigationBarItems(),
              currentIndex: state,
              onTap: _onBottomNavigationTap,
            );
          }
        ),
      ),
    );
  }

  void _onBottomNavigationTap(int index) async {
    dashboardBloc.add(DashboardNavigationClickEvent(index: index));
  }
}