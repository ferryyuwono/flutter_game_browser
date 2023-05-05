import 'dart:async';

import 'package:feature_dashboard/feature_dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(super.initialState);
}

@Injectable(as: DashboardBloc)
class DashboardBlocImpl extends DashboardBloc {
  DashboardBlocImpl() : super(DashboardState()) {
    on<DashboardNavigationClickEvent>(
      _onDashboardNavigationClickEvent,
    );
  }

  FutureOr<void> _onDashboardNavigationClickEvent(
    DashboardNavigationClickEvent event,
    Emitter<DashboardState> emit
  ) async {
    emit(state.copyWith(selectedBottomNavigationIndex: event.index));
  }
}
