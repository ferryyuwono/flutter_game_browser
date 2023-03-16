import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class RawgApiClient extends RestApiClient {
  RawgApiClient(): super(baseUrl: 'https://api.rawg.io/api/');
}
