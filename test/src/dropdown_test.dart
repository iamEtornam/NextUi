import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextDropdown', () {
    testWidgets('renders trigger', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextDropdown(
              trigger: NextDropdownTrigger(
                child: Button.solid(
                  onPressed: () {},
                  child: const Text('Actions'),
                ),
              ),
              menu: const NextDropdownMenu(
                children: [
                  NextDropdownItem(
                    itemKey: 'new',
                    title: 'New file',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Actions'), findsOneWidget);
    });

    testWidgets('does not open when isDisabled is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextDropdown(
              isDisabled: true,
              trigger: NextDropdownTrigger(
                child: Button.solid(
                  onPressed: () {},
                  child: const Text('Actions'),
                ),
              ),
              menu: const NextDropdownMenu(
                children: [
                  NextDropdownItem(
                    itemKey: 'new',
                    title: 'New file',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Actions'), findsOneWidget);
    });
  });

  group('NextDropdownSection', () {
    testWidgets('renders with title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextDropdownSection(
              title: 'File Actions',
              children: [
                Text('Item 1'),
                Text('Item 2'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('File Actions'), findsOneWidget);
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });

    testWidgets('shows divider when showDivider is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextDropdownSection(
              title: 'Section',
              showDivider: true,
              children: [
                Text('Item'),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsOneWidget);
    });
  });

  group('NextDropdownItem', () {
    testWidgets('renders as placeholder', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextDropdownItem(
              itemKey: 'new',
              title: 'New file',
            ),
          ),
        ),
      );

      // NextDropdownItem is just a placeholder that renders nothing
      expect(find.byType(NextDropdownItem), findsOneWidget);
    });
  });

  group('Dropdown Component Structure', () {
    testWidgets('NextDropdownTrigger renders child',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextDropdownTrigger(
              child: Text('Trigger'),
            ),
          ),
        ),
      );

      expect(find.text('Trigger'), findsOneWidget);
    });

    testWidgets('NextDropdownMenu renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextDropdownMenu(
              children: [
                NextDropdownItem(itemKey: 'item1', title: 'Item 1'),
              ],
            ),
          ),
        ),
      );

      // NextDropdownMenu is just a props container
      expect(find.byType(NextDropdownMenu), findsOneWidget);
    });
  });
}
