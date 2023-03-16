import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_list.freezed.dart';

@freezed
class PagedList<T> with _$PagedList<T> {
  const PagedList._();

  const factory PagedList({
    required List<T> data,
    @Default('') String nextUrl,
    @Default('') String previousUrl,
    @Default(0) int total,
  }) = _PagedList;
}
