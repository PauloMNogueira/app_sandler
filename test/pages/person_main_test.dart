import 'package:adam_sandler/pages/person_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);
void main() {
  group("Test Person Main Page", () {
    testWidgets("Should return correct render", (WidgetTester tester) async {
      await tester.pumpWidget(makeTestable(PersonMainPage()));
      final Finder finderTitle = find.byKey(Key("unit_title"));

      expect(finderTitle, findsOneWidget);
    });
  });
}
