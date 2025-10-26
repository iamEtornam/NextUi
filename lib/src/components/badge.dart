import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Badge component
///
/// Badges are used as a small numerical value or status descriptor
/// for UI elements.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextBadge(
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// ## Variants
///
/// ```dart
/// // Solid badge (default)
/// NextBadge.solid(
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// // Flat badge
/// NextBadge.flat(
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// // Faded badge
/// NextBadge.faded(
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// // Shadow badge
/// NextBadge.shadow(
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// ## Colors
///
/// ```dart
/// NextBadge(
///   color: BadgeColor.primary,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// NextBadge(
///   color: BadgeColor.success,
///   content: 'New',
///   child: Icon(Icons.mail),
/// )
///
/// NextBadge(
///   color: BadgeColor.danger,
///   content: '99+',
///   child: Icon(Icons.message),
/// )
/// ```
///
/// ## Sizes
///
/// ```dart
/// NextBadge(
///   size: BadgeSize.sm,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// NextBadge(
///   size: BadgeSize.lg,
///   content: '10',
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// ## Placements
///
/// ```dart
/// NextBadge(
///   placement: BadgePlacement.topRight,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// NextBadge(
///   placement: BadgePlacement.bottomLeft,
///   content: 'New',
///   child: Icon(Icons.mail),
/// )
/// ```
///
/// ## Shapes
///
/// ```dart
/// NextBadge(
///   shape: BadgeShape.circle,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
///
/// NextBadge(
///   shape: BadgeShape.rectangle,
///   content: 'New',
///   child: Icon(Icons.mail),
/// )
/// ```
///
/// ## Dot Badge
///
/// ```dart
/// NextBadge(
///   isDot: true,
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// ## Invisible Badge
///
/// ```dart
/// NextBadge(
///   isInvisible: true,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
/// ```
///
/// ## Without Outline
///
/// ```dart
/// NextBadge(
///   showOutline: false,
///   content: '5',
///   child: Icon(Icons.notifications),
/// )
/// ```
class NextBadge extends StatelessWidget {
  /// Creates a Next UI Badge
  const NextBadge({
    required this.child,
    super.key,
    this.variant = BadgeVariant.solid,
    this.color = BadgeColor.defaultColor,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.rectangle,
    this.placement = BadgePlacement.topRight,
    this.content,
    this.showOutline = true,
    this.disableAnimation = false,
    this.isInvisible = false,
    this.isOneChar = false,
    this.isDot = false,
  });

  /// Creates a solid badge (default variant)
  const NextBadge.solid({
    required this.child,
    super.key,
    this.content,
    this.color = BadgeColor.primary,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.rectangle,
    this.placement = BadgePlacement.topRight,
    this.showOutline = true,
    this.disableAnimation = false,
    this.isInvisible = false,
    this.isOneChar = false,
    this.isDot = false,
  }) : variant = BadgeVariant.solid;

  /// Creates a flat badge
  const NextBadge.flat({
    required this.child,
    super.key,
    this.content,
    this.color = BadgeColor.defaultColor,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.rectangle,
    this.placement = BadgePlacement.topRight,
    this.showOutline = true,
    this.disableAnimation = false,
    this.isInvisible = false,
    this.isOneChar = false,
    this.isDot = false,
  }) : variant = BadgeVariant.flat;

  /// Creates a faded badge
  const NextBadge.faded({
    required this.child,
    super.key,
    this.content,
    this.color = BadgeColor.defaultColor,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.rectangle,
    this.placement = BadgePlacement.topRight,
    this.showOutline = true,
    this.disableAnimation = false,
    this.isInvisible = false,
    this.isOneChar = false,
    this.isDot = false,
  }) : variant = BadgeVariant.faded;

  /// Creates a shadow badge
  const NextBadge.shadow({
    required this.child,
    super.key,
    this.content,
    this.color = BadgeColor.primary,
    this.size = BadgeSize.md,
    this.shape = BadgeShape.rectangle,
    this.placement = BadgePlacement.topRight,
    this.showOutline = true,
    this.disableAnimation = false,
    this.isInvisible = false,
    this.isOneChar = false,
    this.isDot = false,
  }) : variant = BadgeVariant.shadow;

  /// Badge variant (solid, flat, faded, shadow)
  final BadgeVariant variant;

  /// Badge color (default, primary, secondary, success, warning, danger)
  final BadgeColor color;

  /// Badge size (sm, md, lg)
  final BadgeSize size;

  /// Badge shape (circle, rectangle)
  final BadgeShape shape;

  /// Badge placement (topRight, topLeft, bottomRight, bottomLeft)
  final BadgePlacement placement;

  /// Badge content (typically text or number)
  final dynamic content;

  /// Whether to show the badge outline
  final bool showOutline;

  /// Whether to disable animation
  final bool disableAnimation;

  /// Whether the badge is invisible
  final bool isInvisible;

  /// Whether the content is a single character
  final bool isOneChar;

  /// Whether to show as a dot without content
  final bool isDot;

  /// The child widget to which the badge is attached
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (!isInvisible) _buildBadge(),
      ],
    );
  }

  /// Builds the badge widget
  Widget _buildBadge() {
    final badgeWidget = Container(
      constraints: isDot ? null : _getConstraints(),
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
        color: _getBackgroundColor(),
        border: showOutline ? _getBorder() : null,
        boxShadow: _getBoxShadow(),
      ),
      padding: isDot ? null : _getPadding(),
      child: isDot ? null : _buildContent(),
    );

    return Positioned(
      top: _getTopPosition(),
      right: _getRightPosition(),
      left: _getLeftPosition(),
      bottom: _getBottomPosition(),
      child: disableAnimation
          ? badgeWidget
          : AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: badgeWidget,
            ),
    );
  }

  /// Builds the badge content
  Widget _buildContent() {
    if (content == null) return const SizedBox.shrink();

    final displayContent = content.toString();

    return DefaultTextStyle(
      style: TextStyle(
        color: _getTextColor(),
        fontSize: _getFontSize(),
        fontWeight: FontWeight.w600,
        height: 1,
      ),
      textAlign: TextAlign.center,
      child: content is Widget
          ? content as Widget
          : Text(
              displayContent,
              textAlign: TextAlign.center,
            ),
    );
  }

  /// Gets badge constraints based on size and content
  BoxConstraints _getConstraints() {
    if (isDot) {
      final dotSize = _getDotSize();
      return BoxConstraints.tight(Size(dotSize, dotSize));
    }

    final minSize = _getMinSize();
    return BoxConstraints(
      minWidth: minSize,
      minHeight: minSize,
    );
  }

  /// Gets minimum badge size
  double _getMinSize() {
    if (isDot) return _getDotSize();

    switch (size) {
      case BadgeSize.sm:
        return isOneChar ? 16 : 20;
      case BadgeSize.md:
        return isOneChar ? 18 : 22;
      case BadgeSize.lg:
        return isOneChar ? 20 : 24;
    }
  }

  /// Gets dot size for dot badge
  double _getDotSize() {
    switch (size) {
      case BadgeSize.sm:
        return 8;
      case BadgeSize.md:
        return 10;
      case BadgeSize.lg:
        return 12;
    }
  }

  /// Gets font size based on badge size
  double _getFontSize() {
    switch (size) {
      case BadgeSize.sm:
        return 10;
      case BadgeSize.md:
        return 11;
      case BadgeSize.lg:
        return 12;
    }
  }

  /// Gets badge border radius based on shape
  BorderRadius _getBorderRadius() {
    if (shape == BadgeShape.circle || isDot) {
      return BorderRadius.circular(9999);
    }

    switch (size) {
      case BadgeSize.sm:
        return BorderRadius.circular(4);
      case BadgeSize.md:
        return BorderRadius.circular(5);
      case BadgeSize.lg:
        return BorderRadius.circular(6);
    }
  }

  /// Gets badge padding
  EdgeInsets _getPadding() {
    if (isDot) return EdgeInsets.zero;

    switch (size) {
      case BadgeSize.sm:
        return isOneChar
            ? const EdgeInsets.all(2)
            : const EdgeInsets.symmetric(horizontal: 4, vertical: 2);
      case BadgeSize.md:
        return isOneChar
            ? const EdgeInsets.all(3)
            : const EdgeInsets.symmetric(horizontal: 5, vertical: 3);
      case BadgeSize.lg:
        return isOneChar
            ? const EdgeInsets.all(4)
            : const EdgeInsets.symmetric(horizontal: 6, vertical: 4);
    }
  }

  /// Gets top position based on placement
  double? _getTopPosition() {
    switch (placement) {
      case BadgePlacement.topRight:
      case BadgePlacement.topLeft:
        return _getOffset();
      case BadgePlacement.bottomRight:
      case BadgePlacement.bottomLeft:
        return null;
    }
  }

  /// Gets right position based on placement
  double? _getRightPosition() {
    switch (placement) {
      case BadgePlacement.topRight:
      case BadgePlacement.bottomRight:
        return _getOffset();
      case BadgePlacement.topLeft:
      case BadgePlacement.bottomLeft:
        return null;
    }
  }

  /// Gets left position based on placement
  double? _getLeftPosition() {
    switch (placement) {
      case BadgePlacement.topLeft:
      case BadgePlacement.bottomLeft:
        return _getOffset();
      case BadgePlacement.topRight:
      case BadgePlacement.bottomRight:
        return null;
    }
  }

  /// Gets bottom position based on placement
  double? _getBottomPosition() {
    switch (placement) {
      case BadgePlacement.bottomRight:
      case BadgePlacement.bottomLeft:
        return _getOffset();
      case BadgePlacement.topRight:
      case BadgePlacement.topLeft:
        return null;
    }
  }

  /// Gets the offset for badge positioning
  double _getOffset() {
    switch (size) {
      case BadgeSize.sm:
        return -4;
      case BadgeSize.md:
        return -5;
      case BadgeSize.lg:
        return -6;
    }
  }

  /// Gets background color based on variant and color
  Color _getBackgroundColor() {
    final baseColor = _getBaseColor();

    switch (variant) {
      case BadgeVariant.solid:
        return baseColor;
      case BadgeVariant.flat:
        return baseColor.withValues(alpha: 0.3);
      case BadgeVariant.faded:
        return baseColor.withValues(alpha: 0.2);
      case BadgeVariant.shadow:
        return baseColor;
    }
  }

  /// Gets border for outline
  Border? _getBorder() {
    if (!showOutline) return null;

    return Border.all(
      color: Colors.white,
      width: 2,
    );
  }

  /// Gets box shadow based on variant
  List<BoxShadow>? _getBoxShadow() {
    if (variant == BadgeVariant.shadow) {
      return [
        BoxShadow(
          color: _getBaseColor().withValues(alpha: 0.4),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
    }
    return null;
  }

  /// Gets text color based on variant and color
  Color _getTextColor() {
    final baseColor = _getBaseColor();

    switch (variant) {
      case BadgeVariant.solid:
      case BadgeVariant.shadow:
        return _getContrastColor(baseColor);
      case BadgeVariant.flat:
      case BadgeVariant.faded:
        return baseColor;
    }
  }

  /// Gets base color based on color enum
  Color _getBaseColor() {
    switch (color) {
      case BadgeColor.defaultColor:
        return const Color(0xFF71717a); // zinc-500
      case BadgeColor.primary:
        return NextUiColors.primary;
      case BadgeColor.secondary:
        return NextUiColors.secondary;
      case BadgeColor.success:
        return NextUiColors.success;
      case BadgeColor.warning:
        return NextUiColors.warning;
      case BadgeColor.danger:
        return NextUiColors.danger;
    }
  }

  /// Gets contrast color for text on colored backgrounds
  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
