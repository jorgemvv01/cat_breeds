import 'package:cat_breeds/utils/api/api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Unit test', () {
    test('Get api URLs', () async{
      final apiBaseURL = Api.getAPIBase();

      expect(apiBaseURL, isNotEmpty);
      expect(apiBaseURL, 'api.thecatapi.com');
    });
  });
}
