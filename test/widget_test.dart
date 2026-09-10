// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ghana_tourism_app/home/repositories/tourist_site_repository.dart';
import 'package:ghana_tourism_app/home/views/home_screen.dart';

void main() {
  testWidgets('shows fallback tourist sites while Supabase is empty', (
    tester,
  ) async {
    final repository = TouristSiteRepository(loadRows: () async => []);

    await tester.pumpWidget(
      MaterialApp(
        home: ExploreScreen(touristSiteRepository: repository),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Tourist Sites'), findsOneWidget);
    expect(find.text('72 places'), findsOneWidget);
  });
}
