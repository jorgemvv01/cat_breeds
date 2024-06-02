import 'package:cat_breeds/domain/cat/model/cat.dart';
import 'package:cat_breeds/main.dart';
import 'package:cat_breeds/presentation/cat_detail/widget/cat_detail_widget.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/presentation/home/widget/cat_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Widget test', () {
    testWidgets('home UI with data test', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            catProvider.overrideWith((ref) => [
              Cat(weight: Weight(imperial: '10', metric: '10'),id: 'abys',name: 'Abyssinian',temperament: 'Active, Energetic, Independent, Intelligent, Gentle',origin: 'Egypt',countryCodes: 'EG',countryCode: 'EG',description: 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',lifeSpan: '14 - 15',indoor: 1,adaptability: 1,affectionLevel: 1,childFriendly: 1,dogFriendly: 1,energyLevel: 1,grooming: 1,healthIssues: 1,intelligence: 5,sheddingLevel: 1,socialNeeds: 1,strangerFriendly: 1,vocalisation: 1,experimental: 1,hairless: 1,natural: 1,rare: 1,rex: 1,suppressedTail: 1,shortLegs: 1,hypoallergenic: 1
            )]),
          ],
          child: const MyApp(),
        ),
      );
    
      expect(find.text('CatBreeds'), findsOneWidget);
      expect(find.text('Search by breed...'), findsOneWidget);
      
      expect(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined), findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined));
      await tester.pump();
      expect(find.widgetWithIcon(IconButton, Icons.sunny), findsOneWidget);

      expect(find.byType(CarItemWidget), findsOneWidget);
      expect(find.text('Abyssinian'), findsOneWidget);

      expect(find.byKey(const ValueKey('see-more-wg')), findsOneWidget);
      expect(find.byKey(const ValueKey('search-text-field-wg')), findsOneWidget);
      
    });

    testWidgets('home UI without data test', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );
    
      expect(find.text('CatBreeds'), findsOneWidget);
      expect(find.text('Search by breed...'), findsOneWidget);
      
      expect(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined), findsOneWidget);
      await tester.tap(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined));
      await tester.pump();
      expect(find.widgetWithIcon(IconButton, Icons.sunny), findsOneWidget);

      expect(find.byType(CarItemWidget), findsNothing);
      expect(find.byKey(const ValueKey('see-more-wg')), findsNothing);
    });

    testWidgets('Detail UI test', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            catProvider.overrideWith((ref) => [
              Cat(weight: Weight(imperial: '10', metric: '10'),id: 'abys',name: 'Abyssinian',temperament: 'Active, Energetic, Independent, Intelligent, Gentle',origin: 'Egypt',countryCodes: 'EG',countryCode: 'EG',description: 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',lifeSpan: '14 - 15',indoor: 1,adaptability: 1,affectionLevel: 1,childFriendly: 1,dogFriendly: 1,energyLevel: 1,grooming: 1,healthIssues: 1,intelligence: 5,sheddingLevel: 1,socialNeeds: 1,strangerFriendly: 1,vocalisation: 1,experimental: 1,hairless: 1,natural: 1,rare: 1,rex: 1,suppressedTail: 1,shortLegs: 1,hypoallergenic: 1
            )]),
          ],
          child: const MyApp(),
        ),
      );
    
      await tester.tap(find.byKey(const ValueKey('see-more-wg')));
      await tester.pumpAndSettle();

      expect(find.byType(CatDatailWidget), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(15));
    });
  });
}
