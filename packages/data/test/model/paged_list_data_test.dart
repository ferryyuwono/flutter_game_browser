import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';

class MockData {
  final int? number;
  MockData({
    this.number
  });

  factory MockData.fromJson(dynamic json) => MockData(
    number: json['number'] as int?,
  );

  Map<String, dynamic> toJson() => {
    "number": number
  };
}

void main() {
  group('PagedListData', () {
    setUp(() {});

    test('when fromJson is called, should return valid object', () async {
      // Given
      final json = {
        "count": 1,
        'next': null,
        'previous': null,
        'results': [
          {
            'number': 1
          }
        ],
      };

      // When
      final PagedListData<MockData> result = PagedListData<MockData>.fromJson(
        json,
        MockData.fromJson
      );

      // Expect
      final expected = PagedListData<MockData>(
        count: 1,
        next: null,
        previous: null,
        results: [
          MockData(
            number: 1
          )
        ]
      );
      expect(result.count, expected.count);
      expect(result.next, expected.next);
      expect(result.previous, expected.previous);
      expect(result.results?.length, expected.results?.length);
    });


    test('when toJson is called, should return valid json', () async {
      // Given
      final data = PagedListData<MockData>(
        count: 1,
        next: null,
        previous: null,
        results: [
          MockData(
              number: 1
          )
        ]
      );

      // When
      final result = data.toJson((item) => item.toJson());

      // Expect
      final expected = {
        "count": 1,
        'next': null,
        'previous': null,
        'results': [
          {
            'number': 1
          }
        ],
      };
      expect(result, expected);
    });

    tearDown(() {});
  });
}
