import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  group('NextAvatar', () {
    testWidgets('renders avatar with image source', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              src: 'https://i.pravatar.cc/150?u=test',
            ),
          ),
        ),
      );

      expect(find.byType(NextAvatar), findsOneWidget);
    });

    testWidgets('renders avatar with initials when name is provided',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              name: 'John Doe',
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders avatar with single initial for single name',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              name: 'John',
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('renders avatar with different sizes', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextAvatar(
                  size: AvatarSize.sm,
                  name: 'S',
                  showFallback: true,
                ),
                NextAvatar(
                  name: 'M',
                  showFallback: true,
                ),
                NextAvatar(
                  size: AvatarSize.lg,
                  name: 'L',
                  showFallback: true,
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

    testWidgets('renders avatar with different colors', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextAvatar(
                  color: AvatarColor.primary,
                  name: 'P',
                  showFallback: true,
                ),
                NextAvatar(
                  color: AvatarColor.success,
                  name: 'S',
                  showFallback: true,
                ),
                NextAvatar(
                  color: AvatarColor.danger,
                  name: 'D',
                  showFallback: true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('P'), findsOneWidget);
      expect(find.text('S'), findsOneWidget);
      expect(find.text('D'), findsOneWidget);
    });

    testWidgets('renders avatar with different radius', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                NextAvatar(
                  radius: AvatarRadius.none,
                  name: 'N',
                  showFallback: true,
                ),
                NextAvatar(
                  radius: AvatarRadius.sm,
                  name: 'S',
                  showFallback: true,
                ),
                NextAvatar(
                  name: 'F',
                  showFallback: true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('N'), findsOneWidget);
      expect(find.text('S'), findsOneWidget);
      expect(find.text('F'), findsOneWidget);
    });

    testWidgets('renders bordered avatar', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              isBordered: true,
              name: 'John Doe',
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
    });

    testWidgets('renders disabled avatar with reduced opacity', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              isDisabled: true,
              name: 'JD',
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.byType(Opacity), findsOneWidget);
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, equals(0.5));
    });

    testWidgets('renders avatar with custom icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              icon: Icon(Icons.person),
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('renders avatar with custom fallback', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              fallback: Icon(Icons.star),
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star), findsOneWidget);
    });

    testWidgets('uses custom getInitials function', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              name: 'John Doe',
              showFallback: true,
              getInitials: (name) => name.substring(0, 1).toUpperCase(),
            ),
          ),
        ),
      );

      expect(find.text('J'), findsOneWidget);
    });

    testWidgets('shows default icon when no content provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatar(
              showFallback: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
    });
  });

  group('NextAvatarGroup', () {
    testWidgets('renders multiple avatars in a group', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              children: [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
                NextAvatar(name: 'Bob Johnson', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
      expect(find.text('JS'), findsOneWidget);
      expect(find.text('BJ'), findsOneWidget);
    });

    testWidgets('limits avatars to max count', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              max: 2,
              children: [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
                NextAvatar(name: 'Bob Johnson', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.text('JD'), findsOneWidget);
      expect(find.text('JS'), findsOneWidget);
      expect(find.text('+1'), findsOneWidget);
    });

    testWidgets('displays total count when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              max: 2,
              total: 10,
              children: [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
                NextAvatar(name: 'Bob Johnson', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.text('+8'), findsOneWidget);
    });

    testWidgets('renders grid layout when isGrid is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              isGrid: true,
              children: [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Wrap), findsOneWidget);
    });

    testWidgets('uses custom renderCount function', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              max: 2,
              renderCount: (count) => Container(
                width: 40,
                height: 40,
                color: Colors.red,
                child: Center(child: Text('$count more')),
              ),
              children: const [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
                NextAvatar(name: 'Bob Johnson', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.text('1 more'), findsOneWidget);
    });

    testWidgets('applies group properties to avatars', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              size: AvatarSize.lg,
              color: AvatarColor.primary,
              isBordered: true,
              children: [
                NextAvatar(name: 'John Doe', showFallback: true),
                NextAvatar(name: 'Jane Smith', showFallback: true),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(NextAvatar), findsNWidgets(2));
    });

    testWidgets('handles empty children list', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: NextAvatarGroup(
              children: [],
            ),
          ),
        ),
      );

      expect(find.byType(NextAvatar), findsNothing);
    });
  });
}
