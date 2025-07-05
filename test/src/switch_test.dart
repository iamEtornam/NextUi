import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextSwitch', () {
    testWidgets('renders basic switch with default values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);

      final switch_ = tester.widget<Switch>(find.byType(Switch));
      expect(switch_.value, false); // default value
    });

    testWidgets('handles initial selected state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              isSelected: true,
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      final switch_ = tester.widget<Switch>(find.byType(Switch));
      expect(switch_.value, true);
    });

    testWidgets('handles switch tap and triggers callbacks', (tester) async {
      var switchValue = false;
      var onChangedCalled = false;
      var onValueChangeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              isSelected: switchValue,
              onChanged: (value) {
                onChangedCalled = true;
                switchValue = value;
              },
              onValueChange: (value) {
                onValueChangeCalled = true;
                switchValue = value;
              },
            ),
          ),
        ),
      );

      expect(find.byType(Switch), findsOneWidget);

      // Initially off
      final switch_ = tester.widget<Switch>(find.byType(Switch));
      expect(switch_.value, false);

      // Tap the switch
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(onChangedCalled, true);
      expect(onValueChangeCalled, true);
    });

    testWidgets('renders label when provided', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              label: const Text('Test Label'),
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('renders start and end content', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              startContent: const Icon(Icons.lightbulb_outline),
              endContent: const Icon(Icons.lightbulb),
              onValueChange: (value) {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.lightbulb_outline), findsOneWidget);
      expect(find.byIcon(Icons.lightbulb), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets('disabled switch does not respond to taps', (tester) async {
      var switchValue = false;
      var callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              isSelected: switchValue,
              isDisabled: true,
              onValueChange: (value) {
                callbackCalled = true;
                switchValue = value;
              },
            ),
          ),
        ),
      );

      // Try to tap the disabled switch
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(callbackCalled, false);
      expect(switchValue, false);

      final switch_ = tester.widget<Switch>(find.byType(Switch));
      expect(switch_.onChanged, isNull); // Should be null when disabled
    });

    testWidgets('read-only switch does not respond to taps', (tester) async {
      var switchValue = true;
      var callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              isSelected: switchValue,
              isReadOnly: true,
              onValueChange: (value) {
                callbackCalled = true;
                switchValue = value;
              },
            ),
          ),
        ),
      );

      // Try to tap the read-only switch
      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(callbackCalled, false);
      expect(switchValue, true);
    });

    testWidgets('tapping label toggles switch when not disabled',
        (tester) async {
      var switchValue = false;
      var callbackCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextSwitch(
              isSelected: switchValue,
              label: const Text('Toggle me'),
              onValueChange: (value) {
                callbackCalled = true;
                switchValue = value;
              },
            ),
          ),
        ),
      );

      // Tap the label
      await tester.tap(find.text('Toggle me'));
      await tester.pump();

      expect(callbackCalled, true);
    });

    group('Static constructors', () {
      testWidgets('small switch constructor works', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextSwitch.small(
                isSelected: true,
                label: const Text('Small Switch'),
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        expect(find.byType(NextSwitch), findsOneWidget);
        expect(find.byType(Switch), findsOneWidget);
        expect(find.text('Small Switch'), findsOneWidget);
      });

      testWidgets('medium switch constructor works', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextSwitch.medium(
                isSelected: true,
                label: const Text('Medium Switch'),
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        expect(find.byType(NextSwitch), findsOneWidget);
        expect(find.byType(Switch), findsOneWidget);
        expect(find.text('Medium Switch'), findsOneWidget);
      });

      testWidgets('large switch constructor works', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextSwitch.large(
                isSelected: true,
                label: const Text('Large Switch'),
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        expect(find.byType(NextSwitch), findsOneWidget);
        expect(find.byType(Switch), findsOneWidget);
        expect(find.text('Large Switch'), findsOneWidget);
      });
    });

    group('Switch colors', () {
      testWidgets('applies correct color theme', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextSwitch(
                isSelected: true,
                color: SwitchColor.success,
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        final switch_ = tester.widget<Switch>(find.byType(Switch));
        expect(
          switch_.activeColor,
          Colors.green,
        ); // Success color should be green
      });
    });

    group('Controlled vs Uncontrolled', () {
      testWidgets('works as controlled component', (tester) async {
        var externalValue = false;

        await tester.pumpWidget(
          StatefulBuilder(
            builder: (context, setState) {
              return MaterialApp(
                home: Scaffold(
                  body: NextSwitch(
                    isSelected: externalValue,
                    onValueChange: (value) {
                      setState(() {
                        externalValue = value;
                      });
                    },
                  ),
                ),
              );
            },
          ),
        );

        // Initially false
        var switch_ = tester.widget<Switch>(find.byType(Switch));
        expect(switch_.value, false);

        // Tap to change
        await tester.tap(find.byType(Switch));
        await tester.pump();

        // Should now be true
        switch_ = tester.widget<Switch>(find.byType(Switch));
        expect(switch_.value, true);
        expect(externalValue, true);
      });

      testWidgets('works as uncontrolled component with default value',
          (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextSwitch(
                defaultSelected: true,
                onValueChange: (value) {},
              ),
            ),
          ),
        );

        final switch_ = tester.widget<Switch>(find.byType(Switch));
        expect(switch_.value, true); // Should use default value
      });
    });
  });
}
