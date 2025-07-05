import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:next_ui/src/base/enums.dart';

/// A card component for displaying content in a container with optional
/// header, body, and footer sections.
///
/// Based on HeroUI Card component design.
class NextCard extends StatelessWidget {
  /// Creates a card component.
  const NextCard({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.children,
    this.shadow = CardShadow.md,
    this.radius = CardRadius.lg,
    this.fullWidth = false,
    this.isHoverable = false,
    this.isPressable = false,
    this.isBlurred = false,
    this.isFooterBlurred = false,
    this.isDisabled = false,
    this.disableAnimation = false,
    this.disableRipple = false,
    this.allowTextSelectionOnPress = false,
    this.onPressed,
    this.onPressStart,
    this.onPressEnd,
    this.onPressChange,
    this.onPressUp,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.decoration,
    this.constraints,
  });

  /// Header content widget
  final Widget? header;

  /// Body content widget
  final Widget? body;

  /// Footer content widget
  final Widget? footer;

  /// Alternative way to provide content as a list of children
  final List<Widget>? children;

  /// Shadow depth of the card
  final CardShadow shadow;

  /// Border radius of the card
  final CardRadius radius;

  /// Whether the card should take full width
  final bool fullWidth;

  /// Whether the card should have hover effects
  final bool isHoverable;

  /// Whether the card should be pressable
  final bool isPressable;

  /// Whether the card should be blurred
  final bool isBlurred;

  /// Whether the footer should be blurred
  final bool isFooterBlurred;

  /// Whether the card is disabled
  final bool isDisabled;

  /// Whether animations should be disabled
  final bool disableAnimation;

  /// Whether ripple effects should be disabled
  final bool disableRipple;

  /// Whether text selection should be allowed on press
  final bool allowTextSelectionOnPress;

  /// Called when the card is pressed
  final VoidCallback? onPressed;

  /// Called when the card press starts
  final VoidCallback? onPressStart;

  /// Called when the card press ends
  final VoidCallback? onPressEnd;

  /// Called when the card press state changes
  final ValueChanged<bool>? onPressChange;

  /// Called when the card press is released
  final VoidCallback? onPressUp;

  /// Internal padding of the card
  final EdgeInsetsGeometry? padding;

  /// External margin of the card
  final EdgeInsetsGeometry? margin;

  /// Fixed height of the card
  final double? height;

  /// Fixed width of the card
  final double? width;

  /// Custom decoration for the card
  final BoxDecoration? decoration;

  /// Size constraints for the card
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    var cardContent = _buildCardContent(context);

    if (isPressable) {
      cardContent = _buildPressableCard(context, cardContent);
    }

    return Container(
      margin: margin,
      height: height,
      width: fullWidth ? double.infinity : width,
      constraints: constraints,
      child: cardContent,
    );
  }

  Widget _buildCardContent(BuildContext context) {
    final cardChildren = <Widget>[];

    if (header != null) {
      cardChildren.add(
        CardHeader(child: header!),
      );
    }

    if (body != null) {
      cardChildren.add(
        Expanded(
          child: CardBody(child: body!),
        ),
      );
    }

    if (footer != null) {
      cardChildren.add(
        CardFooter(
          isBlurred: isFooterBlurred,
          child: footer!,
        ),
      );
    }

    if (children != null) {
      cardChildren.addAll(children!);
    }

    return AnimatedContainer(
      duration:
          disableAnimation ? Duration.zero : const Duration(milliseconds: 250),
      decoration: decoration ?? _buildDecoration(context),
      child: ClipRRect(
        borderRadius: _getBorderRadius(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cardChildren,
        ),
      ),
    );
  }

  Widget _buildPressableCard(BuildContext context, Widget child) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled ? null : onPressed,
        onTapDown: isDisabled ? null : (_) => onPressStart?.call(),
        onTapUp: isDisabled ? null : (_) => onPressEnd?.call(),
        onTapCancel: isDisabled ? null : () => onPressEnd?.call(),
        borderRadius: _getBorderRadius(),
        splashFactory: disableRipple ? NoSplash.splashFactory : null,
        child: child,
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BoxDecoration(
      color: colorScheme.surface,
      borderRadius: _getBorderRadius(),
      boxShadow: _getBoxShadow(context),
      border: Border.all(
        color: colorScheme.outline.withValues(alpha: 0.12),
      ),
    );
  }

  BorderRadius _getBorderRadius() {
    switch (radius) {
      case CardRadius.none:
        return BorderRadius.zero;
      case CardRadius.sm:
        return BorderRadius.circular(8);
      case CardRadius.md:
        return BorderRadius.circular(12);
      case CardRadius.lg:
        return BorderRadius.circular(16);
    }
  }

  List<BoxShadow> _getBoxShadow(BuildContext context) {
    if (shadow == CardShadow.none) return [];

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final shadowColor = isDark ? Colors.black : Colors.grey.shade300;

    switch (shadow) {
      case CardShadow.none:
        return [];
      case CardShadow.sm:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
      case CardShadow.md:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ];
      case CardShadow.lg:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];
    }
  }
}

/// Card header component for displaying title and header content
class CardHeader extends StatelessWidget {
  /// Creates a card header component.
  const CardHeader({
    required this.child,
    super.key,
    this.padding,
  });

  /// The header content
  final Widget child;

  /// Custom padding for the header
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      child: child,
    );
  }
}

/// Card body component for displaying main content
class CardBody extends StatelessWidget {
  /// Creates a card body component.
  const CardBody({
    required this.child,
    super.key,
    this.padding,
  });

  /// The body content
  final Widget child;

  /// Custom padding for the body
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
      child: child,
    );
  }
}

/// Card footer component for displaying actions and footer content
class CardFooter extends StatelessWidget {
  /// Creates a card footer component.
  const CardFooter({
    required this.child,
    super.key,
    this.padding,
    this.isBlurred = false,
  });

  /// The footer content
  final Widget child;

  /// Custom padding for the footer
  final EdgeInsetsGeometry? padding;

  /// Whether the footer should be blurred
  final bool isBlurred;

  @override
  Widget build(BuildContext context) {
    Widget footer = Container(
      padding: padding ?? const EdgeInsets.all(16),
      child: child,
    );

    if (isBlurred) {
      footer = ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            ),
            child: footer,
          ),
        ),
      );
    }

    return footer;
  }
}
