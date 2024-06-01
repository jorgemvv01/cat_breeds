
import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/domain/cat/service/cat_service.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:cat_breeds/main.dart';

void main() {


  group('App test', () {
    setUpAll(() async {
      await dotenv.load(fileName: ".env");
      FlutterSecureStorage.setMockInitialValues({
        'api-key' : dotenv.env['API_KEY'].toString()
      });
    });

    testWidgets('structure UI test', (WidgetTester tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      final BuildContext context = tester.element(find.byType(ProviderScope));
    
      expect(find.text('CatBreeds'), findsOneWidget);

      expect(find.text(AppLocalizations.of(context)?.searchByBreed ?? ''), findsOneWidget);
      
      expect(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined), findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined));
      await tester.pump();
      expect(find.widgetWithIcon(IconButton, Icons.sunny), findsOneWidget);
    });

    test('providers test', () async {
      final container = ProviderContainer();

      expect(
        container.read(searchTextProvider),
        equals(''),
      );

      final catService = container.read(catServiceProvider);
      List<Cat> catsTest =  await catService.getAllBreeds();
      expect(
        catsTest.length,
        37,
      );

      final cats = container.read(catProvider);
      cats.when(
        data: (data) => expect(
          <Cat>[],
          equals(data),
        ),
        error: (error, stackTrace) => expect(
          [],
          equals([]),
        ),
        loading: () => expect(
          [],
          equals([]),
        ),
      );
    });
  });
}
