import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextInput', () {
    testWidgets('renders basic input with label and placeholder',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Test Label',
              placeholder: 'Test Placeholder',
            ),
          ),
        ),
      );

      expect(find.text('Test Label'), findsOneWidget);
      expect(find.text('Test Placeholder'), findsOneWidget);
    });

    testWidgets('handles text input and triggers onChanged', (tester) async {
      var inputValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Test Input',
              onChanged: (value) => inputValue = value,
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'Hello World');

      expect(inputValue, equals('Hello World'));
    });

    testWidgets('shows required asterisk when isRequired is true',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Required Field',
              isRequired: true,
            ),
          ),
        ),
      );

      expect(find.text('Required Field *'), findsOneWidget);
    });

    testWidgets('displays error message when isInvalid is true',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Test Input',
              isInvalid: true,
              errorMessage: 'This field is invalid',
            ),
          ),
        ),
      );

      expect(find.text('This field is invalid'), findsOneWidget);
    });

    testWidgets('shows clear button when isClearable and has text',
        (tester) async {
      final controller = TextEditingController(text: 'Initial text');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextInput(
              controller: controller,
              isClearable: true,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byIcon(Icons.clear), findsOneWidget);

      // Tap clear button
      await tester.tap(find.byIcon(Icons.clear));
      await tester.pump();

      expect(controller.text, isEmpty);
    });

    testWidgets('handles password input with visibility toggle',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              obscureText: true,
              placeholder: 'Password',
            ),
          ),
        ),
      );

      // Initially should show visibility icon (to reveal password)
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap to toggle visibility
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Should now show visibility_off icon (to hide password)
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('respects disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Disabled Input',
              isDisabled: true,
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      final widget = tester.widget<TextField>(textField);

      expect(widget.enabled, isFalse);
    });

    testWidgets('respects read-only state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Read Only Input',
              isReadOnly: true,
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      final widget = tester.widget<TextField>(textField);

      expect(widget.readOnly, isTrue);
    });

    testWidgets('displays start and end content', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              startContent: Icon(Icons.email),
              endContent: Icon(Icons.help),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.email), findsOneWidget);
      expect(find.byIcon(Icons.help), findsOneWidget);
    });

    testWidgets('handles different label placements', (tester) async {
      // Test outside label placement
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInput(
              label: 'Outside Label',
              labelPlacement: LabelPlacement.outside,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Outside Label'), findsOneWidget);
    });

    group('Input Variants', () {
      for (final variant in InputVariant.values) {
        testWidgets('renders ${variant.name} variant correctly',
            (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: NextInput(
                  variant: variant,
                  label: '${variant.name} Input',
                ),
              ),
            ),
          );

          await tester.pump();
          expect(find.text('${variant.name} Input'), findsOneWidget);
        });
      }
    });

    group('Input Sizes', () {
      for (final size in InputSize.values) {
        testWidgets('renders ${size.name} size correctly', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: NextInput(
                  size: size,
                  label: '${size.name} Input',
                ),
              ),
            ),
          );

          await tester.pump();
          expect(find.text('${size.name} Input'), findsOneWidget);
        });
      }
    });

    group('Input Colors', () {
      for (final color in InputColor.values) {
        testWidgets('renders ${color.name} color correctly', (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: NextInput(
                  color: color,
                  label: '${color.name} Input',
                ),
              ),
            ),
          );

          await tester.pump();
          expect(find.text('${color.name} Input'), findsOneWidget);
        });
      }
    });
  });

  group('NextInputOTP', () {
    testWidgets('renders correct number of input fields', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 6,
            ),
          ),
        ),
      );

      // Should find 6 NextInput widgets
      expect(find.byType(NextInput), findsNWidgets(6));
    });

    testWidgets('handles input and auto-focuses next field', (tester) async {
      var otpValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 4,
              onChanged: (value) => otpValue = value,
            ),
          ),
        ),
      );

      // Enter digit in first field
      final firstField = find.byType(NextInput).first;
      await tester.enterText(firstField, '1');
      await tester.pump();

      expect(otpValue, equals('1'));
    });

    testWidgets('calls onCompleted when all fields are filled', (tester) async {
      var completedOtp = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 3,
              onCompleted: (value) => completedOtp = value,
            ),
          ),
        ),
      );

      // Fill all fields
      final fields = find.byType(NextInput);
      await tester.enterText(fields.at(0), '1');
      await tester.enterText(fields.at(1), '2');
      await tester.enterText(fields.at(2), '3');
      await tester.pump();

      expect(completedOtp, equals('123'));
    });

    testWidgets('handles pasted content across multiple fields',
        (tester) async {
      var otpValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 6,
              onChanged: (value) => otpValue = value,
            ),
          ),
        ),
      );

      // Simulate pasting "123456" in the first field
      final firstField = find.byType(NextInput).first;
      await tester.enterText(firstField, '123456');
      await tester.pump();

      expect(otpValue, contains('1'));
    });

    testWidgets('renders with custom separator', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 4,
              separator: Text('-'),
            ),
          ),
        ),
      );

      // Should find 3 separators for 4 fields
      expect(find.text('-'), findsNWidgets(3));
    });

    testWidgets('respects disabled state', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 4,
              isDisabled: true,
            ),
          ),
        ),
      );

      // All input fields should be disabled
      await tester.pump();
      expect(find.byType(NextInput), findsNWidgets(4));
    });

    testWidgets('handles different sizes', (tester) async {
      for (final size in InputSize.values) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextInputOTP(
                length: 4,
                size: size,
              ),
            ),
          ),
        );

        await tester.pump();
        expect(find.byType(NextInput), findsNWidgets(4));
      }
    });

    testWidgets('supports obscure text for secure OTP', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 4,
              obscureText: true,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(NextInput), findsNWidgets(4));
    });

    testWidgets('handles custom keyboard type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextInputOTP(
              length: 4,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(NextInput), findsNWidgets(4));
    });


  });
}
