import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextModal', () {
    testWidgets('renders when isOpen is true', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              child: NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Modal Content'), findsOneWidget);
    });

    testWidgets('does not render when isOpen is false',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              child: NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Modal Content'), findsNothing);
    });

    testWidgets('displays close button by default',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              child: NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('hides close button when hideCloseButton is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              hideCloseButton: true,
              child: NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('calls onClose when close button is tapped',
        (WidgetTester tester) async {
      var closeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              onClose: () {
                closeCalled = true;
              },
              child: const NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(closeCalled, isTrue);
    });

    testWidgets('calls onClose when backdrop is tapped and isDismissable',
        (WidgetTester tester) async {
      var closeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              onClose: () {
                closeCalled = true;
              },
              child: const NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      // Tap outside the modal content (on backdrop)
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      expect(closeCalled, isTrue);
    });

    testWidgets(
        'does not call onClose when backdrop is tapped and not dismissable',
        (WidgetTester tester) async {
      var closeCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              isDismissable: false,
              onClose: () {
                closeCalled = true;
              },
              child: const NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      // Tap outside the modal content (on backdrop)
      await tester.tapAt(const Offset(10, 10));
      await tester.pumpAndSettle();

      expect(closeCalled, isFalse);
    });
  });

  group('NextModalContent', () {
    testWidgets('renders header, body, and footer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              child: NextModalContent(
                header: NextModalHeader(
                  child: Text('Header'),
                ),
                body: NextModalBody(
                  child: Text('Body'),
                ),
                footer: NextModalFooter(
                  child: Text('Footer'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Body'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
    });

    testWidgets('renders custom children', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              child: NextModalContent(
                children: [
                  Text('Child 1'),
                  Text('Child 2'),
                  Text('Child 3'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Child 1'), findsOneWidget);
      expect(find.text('Child 2'), findsOneWidget);
      expect(find.text('Child 3'), findsOneWidget);
    });
  });

  group('NextModalHeader', () {
    testWidgets('renders child with default styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalHeader(
              child: Text('Test Header'),
            ),
          ),
        ),
      );

      expect(find.text('Test Header'), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalHeader(
              padding: EdgeInsets.all(32),
              child: Text('Test Header'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Test Header'),
          matching: find.byType(Container),
        ),
      );

      expect(container.padding, const EdgeInsets.all(32));
    });
  });

  group('NextModalBody', () {
    testWidgets('renders child with scrolling', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalBody(
              child: Text('Test Body'),
            ),
          ),
        ),
      );

      expect(find.text('Test Body'), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalBody(
              padding: EdgeInsets.all(32),
              child: Text('Test Body'),
            ),
          ),
        ),
      );

      final scrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );

      expect(scrollView.padding, const EdgeInsets.all(32));
    });
  });

  group('NextModalFooter', () {
    testWidgets('renders child with default styling',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalFooter(
              child: Text('Test Footer'),
            ),
          ),
        ),
      );

      expect(find.text('Test Footer'), findsOneWidget);
    });

    testWidgets('applies custom padding', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModalFooter(
              padding: EdgeInsets.all(32),
              child: Text('Test Footer'),
            ),
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.text('Test Footer'),
          matching: find.byType(Container),
        ),
      );

      expect(container.padding, const EdgeInsets.all(32));
    });
  });

  group('Modal Sizes', () {
    for (final size in ModalSize.values) {
      testWidgets('renders with size $size', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextModal(
                isOpen: true,
                size: size,
                child: const NextModalContent(
                  body: NextModalBody(
                    child: Text('Modal Content'),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Modal Content'), findsOneWidget);
      });
    }
  });

  group('Modal Placements', () {
    for (final placement in ModalPlacement.values) {
      testWidgets('renders with placement $placement',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextModal(
                isOpen: true,
                placement: placement,
                child: const NextModalContent(
                  body: NextModalBody(
                    child: Text('Modal Content'),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Modal Content'), findsOneWidget);
      });
    }
  });

  group('Modal Backdrops', () {
    for (final backdrop in ModalBackdrop.values) {
      testWidgets('renders with backdrop $backdrop',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextModal(
                isOpen: true,
                backdrop: backdrop,
                child: const NextModalContent(
                  body: NextModalBody(
                    child: Text('Modal Content'),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Modal Content'), findsOneWidget);
      });
    }
  });

  group('Modal ScrollBehavior', () {
    for (final scrollBehavior in ModalScrollBehavior.values) {
      testWidgets('renders with scrollBehavior $scrollBehavior',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: NextModal(
                isOpen: true,
                scrollBehavior: scrollBehavior,
                child: const NextModalContent(
                  body: NextModalBody(
                    child: Text('Modal Content'),
                  ),
                ),
              ),
            ),
          ),
        );

        expect(find.text('Modal Content'), findsOneWidget);
      });
    }
  });

  group('Modal Custom Close Button', () {
    testWidgets('renders custom close button', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              closeButton: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () {},
              ),
              child: const NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });
  });

  group('Modal Draggable', () {
    testWidgets('can be dragged when isDraggable is true',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextModal(
              isOpen: true,
              isDraggable: true,
              child: NextModalContent(
                body: NextModalBody(
                  child: Text('Modal Content'),
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Modal Content'), findsOneWidget);

      // Find the modal content and perform drag gesture
      final modalFinder = find.text('Modal Content');
      await tester.drag(modalFinder, const Offset(100, 100));
      await tester.pumpAndSettle();

      expect(find.text('Modal Content'), findsOneWidget);
    });
  });
}
