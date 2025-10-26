import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextBadge', () {
    testWidgets('renders basic badge with content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              content: '5',
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('renders badge with different variants', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextBadge.solid(
                  content: '1',
                  child: Icon(Icons.mail),
                ),
                NextBadge.flat(
                  content: '2',
                  child: Icon(Icons.mail),
                ),
                NextBadge.faded(
                  content: '3',
                  child: Icon(Icons.mail),
                ),
                NextBadge.shadow(
                  content: '4',
                  child: Icon(Icons.mail),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('4'), findsOneWidget);
    });

    testWidgets('renders badge with different colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextBadge(
                  color: BadgeColor.primary,
                  content: 'Primary',
                  child: Icon(Icons.star),
                ),
                NextBadge(
                  color: BadgeColor.success,
                  content: 'Success',
                  child: Icon(Icons.check),
                ),
                NextBadge(
                  color: BadgeColor.danger,
                  content: 'Danger',
                  child: Icon(Icons.error),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Danger'), findsOneWidget);
    });

    testWidgets('renders badge with different sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextBadge(
                  size: BadgeSize.sm,
                  content: 'S',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  content: 'M',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  size: BadgeSize.lg,
                  content: 'L',
                  child: Icon(Icons.mail),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('S'), findsOneWidget);
      expect(find.text('M'), findsOneWidget);
      expect(find.text('L'), findsOneWidget);
    });

    testWidgets('renders badge with different placements', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextBadge(
                  content: 'TR',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  placement: BadgePlacement.topLeft,
                  content: 'TL',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  placement: BadgePlacement.bottomRight,
                  content: 'BR',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  placement: BadgePlacement.bottomLeft,
                  content: 'BL',
                  child: Icon(Icons.mail),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('TR'), findsOneWidget);
      expect(find.text('TL'), findsOneWidget);
      expect(find.text('BR'), findsOneWidget);
      expect(find.text('BL'), findsOneWidget);
    });

    testWidgets('renders badge with different shapes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextBadge(
                  shape: BadgeShape.circle,
                  content: '5',
                  child: Icon(Icons.mail),
                ),
                NextBadge(
                  content: 'New',
                  child: Icon(Icons.mail),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
      expect(find.text('New'), findsOneWidget);
    });

    testWidgets('renders dot badge without content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              isDot: true,
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('hides badge when isInvisible is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              isInvisible: true,
              content: '5',
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.text('5'), findsNothing);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('renders badge without outline', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              showOutline: false,
              content: '5',
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
    });

    testWidgets('renders badge with numeric content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              content: 99,
              child: Icon(Icons.mail),
            ),
          ),
        ),
      );

      expect(find.text('99'), findsOneWidget);
    });

    testWidgets('renders badge with widget content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              content: Icon(Icons.star, size: 12),
              child: Icon(Icons.mail),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
      expect(find.byIcon(Icons.mail), findsOneWidget);
    });

    testWidgets('applies animation when disableAnimation is false',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              content: '5',
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
    });

    testWidgets('skips animation when disableAnimation is true',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              disableAnimation: true,
              content: '5',
              child: Icon(Icons.notifications),
            ),
          ),
        ),
      );

      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('renders with isOneChar flag', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextBadge(
              isOneChar: true,
              content: 'A',
              child: Icon(Icons.mail),
            ),
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);
    });
  });
}
