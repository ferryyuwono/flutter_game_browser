import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_list_data.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PagedListData<T> {
  final int? count;
  final String? next;
  final String? previous;
  final List<T>? results;

  PagedListData({
    @JsonKey(name: 'count') this.count,
    @JsonKey(name: 'next') this.next,
    @JsonKey(name: 'previous') this.previous,
    @JsonKey(name: 'results') this.results,
  });

  factory PagedListData.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
    _$PagedListDataFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(dynamic Function(T) toJsonT) =>
    _$PagedListDataToJson(this, toJsonT);
}
