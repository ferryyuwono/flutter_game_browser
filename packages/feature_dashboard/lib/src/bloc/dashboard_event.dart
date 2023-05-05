import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.freezed.dart';

abstract class DashboardEvent {}

@freezed
class DashboardNavigationClickEvent extends DashboardEvent with _$DashboardNavigationClickEvent {
  const factory DashboardNavigationClickEvent({
    required int index,
  }) = _DashboardNavigationClickEvent;
}
