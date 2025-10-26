import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

class TestUser {
  TestUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  final String id;
  final String name;
  final String email;
  final String role;
}

void main() {
  final testUsers = [
    TestUser(
        id: '1', name: 'John Doe', email: 'john@example.com', role: 'Admin',),
    TestUser(
        id: '2', name: 'Jane Smith', email: 'jane@example.com', role: 'User',),
    TestUser(
        id: '3', name: 'Bob Johnson', email: 'bob@example.com', role: 'User',),
  ];

  final testColumns = [
    TableColumnDef<TestUser>(
      key: 'name',
      label: 'Name',
      builder: (user) => Text(user.name),
    ),
    TableColumnDef<TestUser>(
      key: 'email',
      label: 'Email',
      builder: (user) => Text(user.email),
    ),
    TableColumnDef<TestUser>(
      key: 'role',
      label: 'Role',
      builder: (user) => Text(user.role),
    ),
  ];

  group('NextTable', () {
    testWidgets('renders table with data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: testColumns,
              rows: testUsers,
            ),
          ),
        ),
      );

      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Role'), findsOneWidget);
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Jane Smith'), findsOneWidget);
    });

    testWidgets('shows empty state when no data', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: testColumns,
              rows: const [],
              emptyContent: const Text('No users found'),
            ),
          ),
        ),
      );

      expect(find.text('No users found'), findsOneWidget);
    });

    testWidgets('hides header when hideHeader is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: testColumns,
              rows: testUsers,
              hideHeader: true,
            ),
          ),
        ),
      );

      expect(find.text('Name'), findsNothing);
      expect(find.text('Email'), findsNothing);
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('renders striped rows when isStriped is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: testColumns,
              rows: testUsers,
              isStriped: true,
            ),
          ),
        ),
      );

      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Jane Smith'), findsOneWidget);
    });

    testWidgets('handles single selection', (WidgetTester tester) async {
      Set<String>? selectedKeys;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: testColumns,
              rows: testUsers,
              selectionMode: TableSelectionMode.single,
              onSelectionChange: (keys) {
                selectedKeys = keys;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('John Doe'));
      await tester.pumpAndSettle();

      expect(selectedKeys, isNotNull);
      expect(selectedKeys!.length, equals(1));
    });

    testWidgets('renders sortable columns', (WidgetTester tester) async {
      final sortableColumns = [
        TableColumnDef<TestUser>(
          key: 'name',
          label: 'Name',
          allowsSorting: true,
          builder: (user) => Text(user.name),
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextTable<TestUser>(
              columns: sortableColumns,
              rows: testUsers,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.unfold_more), findsOneWidget);
    });
  });

  group('Table Components', () {
    testWidgets('NextTableHeader renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTableHeader(
              children: [Text('Column 1')],
            ),
          ),
        ),
      );

      expect(find.byType(NextTableHeader), findsOneWidget);
    });

    testWidgets('NextTableColumn renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTableColumn(
              children: Text('Column'),
            ),
          ),
        ),
      );

      expect(find.byType(NextTableColumn), findsOneWidget);
    });

    testWidgets('NextTableBody renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTableBody(
              children: [],
            ),
          ),
        ),
      );

      expect(find.byType(NextTableBody), findsOneWidget);
    });

    testWidgets('NextTableRow renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTableRow(
              children: [Text('Cell')],
            ),
          ),
        ),
      );

      expect(find.byType(NextTableRow), findsOneWidget);
    });

    testWidgets('NextTableCell renders as placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextTableCell(
              children: Text('Cell Content'),
            ),
          ),
        ),
      );

      expect(find.byType(NextTableCell), findsOneWidget);
    });
  });
}
