import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextCard', () {
    testWidgets('renders basic card with header, body, and footer',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextCard(
              header: Text('Test Header'),
              body: Text('Test Body'),
              footer: Text('Test Footer'),
            ),
          ),
        ),
      );

      expect(find.text('Test Header'), findsOneWidget);
      expect(find.text('Test Body'), findsOneWidget);
      expect(find.text('Test Footer'), findsOneWidget);
    });

    testWidgets('renders pressable card and handles tap', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextCard(
              isPressable: true,
              onPressed: () => tapped = true,
              body: const Text('Pressable Card'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Pressable Card'));
      expect(tapped, isTrue);
    });

    testWidgets('renders card with custom children', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextCard(
              children: [
                CardHeader(child: Text('Custom Header')),
                CardBody(child: Text('Custom Body')),
                CardFooter(child: Text('Custom Footer')),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Custom Header'), findsOneWidget);
      expect(find.text('Custom Body'), findsOneWidget);
      expect(find.text('Custom Footer'), findsOneWidget);
    });

    testWidgets('applies correct shadow and radius', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextCard(
              shadow: CardShadow.lg,
              radius: CardRadius.sm,
              body: Text('Styled Card'),
            ),
          ),
        ),
      );

      expect(find.text('Styled Card'), findsOneWidget);
    });

    testWidgets('renders with full width', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextCard(
              fullWidth: true,
              body: Text('Full Width Card'),
            ),
          ),
        ),
      );

      expect(find.text('Full Width Card'), findsOneWidget);
    });
  });

  group('CardHeader', () {
    testWidgets('renders with custom padding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardHeader(
              padding: EdgeInsets.all(32),
              child: Text('Header'),
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
    });
  });

  group('CardBody', () {
    testWidgets('renders with custom padding', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardBody(
              padding: EdgeInsets.all(32),
              child: Text('Body'),
            ),
          ),
        ),
      );

      expect(find.text('Body'), findsOneWidget);
    });
  });

  group('CardFooter', () {
    testWidgets('renders with blur effect', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CardFooter(
              isBlurred: true,
              child: Text('Blurred Footer'),
            ),
          ),
        ),
      );

      expect(find.text('Blurred Footer'), findsOneWidget);
    });
  });
}
