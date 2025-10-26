import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextTooltip', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              child: Text('Hover me'),
            ),
          ),
        ),
      );

      expect(find.text('Hover me'), findsOneWidget);
    });

    testWidgets('shows tooltip on hover', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              child: Text('Hover me'),
            ),
          ),
        ),
      );

      expect(find.text('Tooltip text'), findsNothing);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.text('Hover me')));
      await tester.pumpAndSettle();

      expect(find.text('Tooltip text'), findsOneWidget);
    });

    testWidgets('hides tooltip when disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              isDisabled: true,
              child: Text('Hover me'),
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.text('Hover me')));
      await tester.pumpAndSettle();

      expect(find.text('Tooltip text'), findsNothing);
    });

    testWidgets('shows tooltip when isOpen is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              isOpen: true,
              child: Text('Hover me'),
            ),
          ),
        ),
      );

      expect(find.text('Tooltip text'), findsOneWidget);
    });

    testWidgets('hides tooltip when isOpen is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              isOpen: false,
              child: Text('Hover me'),
            ),
          ),
        ),
      );

      expect(find.text('Tooltip text'), findsNothing);
    });

    testWidgets('calls onOpenChange when tooltip opens',
        (WidgetTester tester) async {
      bool? isOpen;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip text',
              onOpenChange: (value) {
                isOpen = value;
              },
              child: const Text('Hover me'),
            ),
          ),
        ),
      );

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      await gesture.moveTo(tester.getCenter(find.text('Hover me')));
      await tester.pumpAndSettle();

      expect(isOpen, isTrue);
    });
  });

  group('Tooltip Sizes', () {
    for (final size in TooltipSize.values) {
      testWidgets('renders with size $size', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextTooltip(
                content: 'Tooltip',
                size: size,
                isOpen: true,
                child: const Text('Child'),
              ),
            ),
          ),
        );

        expect(find.text('Tooltip'), findsOneWidget);
      });
    }
  });

  group('Tooltip Colors', () {
    for (final color in TooltipColor.values) {
      testWidgets('renders with color $color', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextTooltip(
                content: 'Tooltip',
                color: color,
                isOpen: true,
                child: const Text('Child'),
              ),
            ),
          ),
        );

        expect(find.text('Tooltip'), findsOneWidget);
      });
    }
  });

  group('Tooltip Placements', () {
    for (final placement in TooltipPlacement.values) {
      testWidgets('renders with placement $placement',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: NextTooltip(
                  content: 'Tooltip',
                  placement: placement,
                  isOpen: true,
                  child: const Text('Child'),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Tooltip'), findsOneWidget);
      });
    }
  });

  group('Tooltip with Arrow', () {
    testWidgets('renders tooltip with arrow enabled',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTooltip(
              content: 'Tooltip with arrow',
              showArrow: true,
              isOpen: true,
              child: Text('Child'),
            ),
          ),
        ),
      );

      expect(find.text('Tooltip with arrow'), findsOneWidget);
      // Arrow is rendered via CustomPaint
      expect(find.byType(CustomPaint), findsWidgets);
    });
  });
}
