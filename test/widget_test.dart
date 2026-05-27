import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_operator_console/main.dart';

void main() {
  testWidgets('renders operator console hero and queue labels', (tester) async {
    await tester.pumpWidget(const OperatorConsoleApp());
    await tester.pumpAndSettle();

    expect(find.text('Flutter Operator Console'.toUpperCase()), findsOneWidget);
    expect(find.textContaining('Ship mobile-safe operator workflows'), findsOneWidget);
    expect(find.text('Operator KPIs'), findsOneWidget);
    expect(find.text('Packet Queue'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
