import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/main.dart';
import 'package:cat_breeds/presentation/cat_detail/screen/cat_detail_screen.dart';
import 'package:cat_breeds/presentation/home/provider/home_provider.dart';
import 'package:cat_breeds/presentation/home/screen/home_screen.dart';
import 'package:cat_breeds/presentation/home/widget/cat_item_widget.dart';
import 'package:cat_breeds/utils/widget/no_record_found/no_record_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('end-to-end test', () {
    setUpAll(() async{
      await getStorage();
    });
    
    testWidgets('show cards and tap on dark mode button',(tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();
      expect(find.byType(CarItemWidget), findsWidgets);

      expect(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined), findsOneWidget);

      await tester.tap(find.widgetWithIcon(IconButton, Icons.dark_mode_outlined));
      await tester.pumpAndSettle();

      expect(find.widgetWithIcon(IconButton, Icons.sunny), findsOneWidget);
    });

    testWidgets('search cat by breed',(tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithIcon(IconButton, Icons.search_outlined));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const ValueKey('search-text-field-wg')), 'Aegean');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(CarItemWidget), findsOneWidget);

      await tester.tap(find.widgetWithIcon(IconButton, Icons.cancel_outlined));
      await tester.pumpAndSettle();

      expect(find.byType(CarItemWidget), findsWidgets);
    });
    

    testWidgets('refresh indicator',(tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      await tester.fling(
        find.byType(ListView),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
    });

    testWidgets('search for cat without results',(tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const ValueKey('search-text-field-wg')), 'azswqdf');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.byType(NoRecordFound), findsOneWidget);

      final element = tester.element(find.byType(HomeScreen));
      final container = ProviderScope.containerOf(element);
      container.read(searchTextProvider.notifier).search('');
      await tester.tap(find.byKey(const ValueKey('reload-wg')));
      await tester.pumpAndSettle();

      expect(find.byType(NoRecordFound), findsNothing);
      expect(find.byType(CarItemWidget), findsWidgets);
    });


    testWidgets('open detail',(tester) async {
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(const ValueKey('search-text-field-wg')), 'Aegean');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const ValueKey('see-more-wg')));
      await tester.pumpAndSettle();
      
      expect(find.byType(CatDetailScreen), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}