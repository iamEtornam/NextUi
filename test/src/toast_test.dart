import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextToastProvider', () {
    testWidgets('renders child widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: NextToastProvider(
            child: Scaffold(
              body: Text('App Content'),
            ),
          ),
        ),
      );

      expect(find.text('App Content'), findsOneWidget);
    });

    testWidgets('can be accessed via context', (WidgetTester tester) async {
      late NextToastProviderState provider;

      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                provider = NextToastProvider.of(context);
                return const Scaffold(
                  body: Text('App'),
                );
              },
            ),
          ),
        ),
      );

      expect(provider, isNotNull);
    });

    testWidgets('addToast adds toast to the list', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showToast(
                        context,
                        title: 'Test Toast',
                        description: 'This is a test',
                      );
                    },
                    child: const Text('Show Toast'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Toast'));
      await tester.pumpAndSettle();

      expect(find.text('Test Toast'), findsOneWidget);
      expect(find.text('This is a test'), findsOneWidget);
    });

    testWidgets('removeToast removes toast from the list',
        (WidgetTester tester) async {
      String? toastId;

      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      toastId = showToast(
                        context,
                        title: 'Test Toast',
                        timeout: 0,
                      );
                    },
                    child: const Text('Show Toast'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Toast'));
      await tester.pumpAndSettle();

      expect(find.text('Test Toast'), findsOneWidget);

    
          tester.state<NextToastProviderState>(find.byType(NextToastProvider))
      .removeToast(toastId!);
      await tester.pumpAndSettle();

      expect(find.text('Test Toast'), findsNothing);
    });

    testWidgets('respects maxVisibleToasts limit', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            maxVisibleToasts: 2,
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showToast(context, title: 'Toast 1', timeout: 0);
                      showToast(context, title: 'Toast 2', timeout: 0);
                      showToast(context, title: 'Toast 3', timeout: 0);
                    },
                    child: const Text('Show Toasts'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Toasts'));
      await tester.pumpAndSettle();

      // Should only show 2 toasts even though 3 were added
      expect(find.byType(NextToast), findsNWidgets(2));
    });

    testWidgets('toast auto-dismisses after timeout',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showToast(
                        context,
                        title: 'Auto Dismiss',
                        timeout: 1000,
                      );
                    },
                    child: const Text('Show Toast'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Toast'));
      await tester.pumpAndSettle();

      expect(find.text('Auto Dismiss'), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 1100));
      await tester.pumpAndSettle();

      expect(find.text('Auto Dismiss'), findsNothing);
    });
  });

  group('Toast Helpers', () {
    testWidgets('showSuccessToast shows success toast',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showSuccessToast(
                        context,
                        title: 'Success!',
                        description: 'Operation completed',
                      );
                    },
                    child: const Text('Show Success'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Success'));
      await tester.pumpAndSettle();

      expect(find.text('Success!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('showErrorToast shows error toast',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showErrorToast(
                        context,
                        title: 'Error!',
                        description: 'Something went wrong',
                      );
                    },
                    child: const Text('Show Error'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Error'));
      await tester.pumpAndSettle();

      expect(find.text('Error!'), findsOneWidget);
      expect(find.byIcon(Icons.error), findsOneWidget);
    });

    testWidgets('showWarningToast shows warning toast',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showWarningToast(
                        context,
                        title: 'Warning!',
                        description: 'Please be careful',
                      );
                    },
                    child: const Text('Show Warning'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Warning'));
      await tester.pumpAndSettle();

      expect(find.text('Warning!'), findsOneWidget);
      expect(find.byIcon(Icons.warning), findsOneWidget);
    });

    testWidgets('showInfoToast shows info toast', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NextToastProvider(
            child: Builder(
              builder: (context) {
                return Scaffold(
                  body: ElevatedButton(
                    onPressed: () {
                      showInfoToast(
                        context,
                        title: 'Info',
                        description: 'Here is some information',
                      );
                    },
                    child: const Text('Show Info'),
                  ),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Info'));
      await tester.pumpAndSettle();

      expect(find.text('Info'), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });
  });

  group('Toast Variants', () {
    for (final variant in ToastVariant.values) {
      testWidgets('renders with variant $variant', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: NextToastProvider(
              child: Builder(
                builder: (context) {
                  return Scaffold(
                    body: ElevatedButton(
                      onPressed: () {
                        showToast(
                          context,
                          title: 'Test Toast',
                          variant: variant,
                          timeout: 0,
                        );
                      },
                      child: const Text('Show Toast'),
                    ),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Toast'));
        await tester.pumpAndSettle();

        expect(find.text('Test Toast'), findsOneWidget);
      });
    }
  });

  group('Toast Colors', () {
    for (final color in ToastColor.values) {
      testWidgets('renders with color $color', (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: NextToastProvider(
              child: Builder(
                builder: (context) {
                  return Scaffold(
                    body: ElevatedButton(
                      onPressed: () {
                        showToast(
                          context,
                          title: 'Test Toast',
                          color: color,
                          timeout: 0,
                        );
                      },
                      child: const Text('Show Toast'),
                    ),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Toast'));
        await tester.pumpAndSettle();

        expect(find.text('Test Toast'), findsOneWidget);
      });
    }
  });

  group('Toast Placements', () {
    for (final placement in ToastPlacement.values) {
      testWidgets('renders with placement $placement',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: NextToastProvider(
              placement: placement,
              child: Builder(
                builder: (context) {
                  return Scaffold(
                    body: ElevatedButton(
                      onPressed: () {
                        showToast(
                          context,
                          title: 'Test Toast',
                          timeout: 0,
                        );
                      },
                      child: const Text('Show Toast'),
                    ),
                  );
                },
              ),
            ),
          ),
        );

        await tester.tap(find.text('Show Toast'));
        await tester.pumpAndSettle();

        expect(find.text('Test Toast'), findsOneWidget);
      });
    }
  });
}
