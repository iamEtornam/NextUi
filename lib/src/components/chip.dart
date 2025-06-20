import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Chip component
///
/// A small block of essential information that represents 
/// an input, attribute, or action.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextChip(
///   child: Text('Basic Chip'),
/// )
/// ```
///
/// ## Variants
///
/// ```dart
/// // Solid chip (default)
/// NextChip.solid(
///   child: Text('Solid'),
/// )
///
/// // Bordered chip
/// NextChip.bordered(
///   child: Text('Bordered'),
/// )
///
/// // Light chip
/// NextChip.light(
///   child: Text('Light'),
/// )
///
/// // Dot chip with indicator
/// NextChip.dot(
///   child: Text('Status'),
/// )
/// ```
///
/// ## Colors
///
/// ```dart
/// NextChip(
///   color: ChipColor.primary,
///   child: Text('Primary'),
/// )
///
/// NextChip(
///   color: ChipColor.success,
///   child: Text('Success'),
/// )
///
/// NextChip(
///   color: ChipColor.danger,
///   child: Text('Danger'),
/// )
/// ```
///
/// ## Sizes
///
/// ```dart
/// NextChip(
///   size: ChipSize.sm,
///   child: Text('Small'),
/// )
///
/// NextChip(
///   size: ChipSize.lg,
///   child: Text('Large'),
/// )
/// ```
///
/// ## With Close Button
///
/// ```dart
/// NextChip(
///   onClose: (event) => print('Chip closed'),
///   child: Text('Closable'),
/// )
/// ```
///
/// ## With Avatar
///
/// ```dart
/// NextChip(
///   avatar: CircleAvatar(
///     child: Text('A'),
///     radius: 12,
///   ),
///   child: Text('With Avatar'),
/// )
/// ```
///
/// ## With Start & End Content
///
/// ```dart
/// NextChip(
///   startContent: Icon(Icons.star, size: 16),
///   child: Text('Starred'),
/// )
///
/// NextChip(
///   endContent: Icon(Icons.arrow_forward, size: 16),
///   child: Text('Action'),
/// )
/// ```
class NextChip extends StatelessWidget {
  /// Creates a Next UI Chip
  const NextChip({
    super.key,
    this.variant = ChipVariant.solid,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
    this.child,
  });

  /// Creates a solid chip (default variant)
  const NextChip.solid({
    required this.child,
    super.key,
    this.color = ChipColor.primary,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.solid;

  /// Creates a bordered chip
  const NextChip.bordered({
    required this.child,
    super.key,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.bordered;

  /// Creates a light chip
  const NextChip.light({
    required this.child,
    super.key,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.light;

  /// Creates a flat chip
  const NextChip.flat({
    required this.child,
    super.key,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.flat;

  /// Creates a faded chip
  const NextChip.faded({
    required this.child,
    super.key,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.faded;

  /// Creates a shadow chip
  const NextChip.shadow({
    required this.child,
    super.key,
    this.color = ChipColor.primary,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.shadow;

  /// Creates a dot chip with status indicator
  const NextChip.dot({
    required this.child,
    super.key,
    this.color = ChipColor.defaultColor,
    this.size = ChipSize.md,
    this.radius = ChipRadius.full,
    this.startContent,
    this.endContent,
    this.avatar,
    this.onClose,
    this.isDisabled = false,
  }) : variant = ChipVariant.dot;

  /// Chip variant (solid, bordered, light, flat, faded, shadow, dot)
  final ChipVariant variant;

  /// Chip color (default, primary, secondary, success, warning, danger)
  final ChipColor color;

  /// Chip size (sm, md, lg)
  final ChipSize size;

  /// Chip border radius (none, sm, md, lg, full)
  final ChipRadius radius;

  /// Widget to display before the main content
  final Widget? startContent;

  /// Widget to display after the main content
  final Widget? endContent;

  /// Avatar widget to display before the content
  final Widget? avatar;

  /// Callback when close button is pressed
  final void Function(dynamic)? onClose;

  /// Whether the chip is disabled
  final bool isDisabled;

  /// Main chip content (typically text)
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _getHeight(),
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
        border: _getBorder(),
        color: _getBackgroundColor(),
        boxShadow: _getBoxShadow(),
      ),
      padding: _getPadding(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildContent(),
      ),
    );
  }

  /// Builds the chip content based on configuration
  List<Widget> _buildContent() {
    final content = <Widget>[];

    // Add dot indicator for dot variant
    if (variant == ChipVariant.dot) {
      content.addAll([
        _buildDotIndicator(),
        SizedBox(width: _getSpacing()),
      ]);
    }

    // Add avatar
    if (avatar != null) {
      content.addAll([
        _buildAvatar(),
        SizedBox(width: _getSpacing()),
      ]);
    }

    // Add start content
    if (startContent != null) {
      content.addAll([
        startContent!,
        SizedBox(width: _getSpacing()),
      ]);
    }

    // Add main content
    if (child != null) {
      content.add(
        DefaultTextStyle(
          style: TextStyle(
            color: _getTextColor(),
            fontSize: _getFontSize(),
            fontWeight: FontWeight.w500,
          ),
          child: child!,
        ),
      );
    }

    // Add end content
    if (endContent != null) {
      content.addAll([
        SizedBox(width: _getSpacing()),
        endContent!,
      ]);
    }

    // Add close button
    if (onClose != null) {
      content.addAll([
        SizedBox(width: _getSpacing()),
        _buildCloseButton(),
      ]);
    }

    return content;
  }

  /// Builds the dot indicator for dot variant
  Widget _buildDotIndicator() {
    return Container(
      width: _getDotSize(),
      height: _getDotSize(),
      decoration: BoxDecoration(
        color: _getBaseColor(),
        shape: BoxShape.circle,
      ),
    );
  }

  /// Builds the avatar with proper sizing
  Widget _buildAvatar() {
    if (avatar == null) return const SizedBox.shrink();

    final avatarSize = _getAvatarSize();
    return SizedBox(
      width: avatarSize,
      height: avatarSize,
      child: ClipOval(child: avatar),
    );
  }

  /// Builds the close button
  Widget _buildCloseButton() {
    return GestureDetector(
      onTap: isDisabled ? null : () => onClose?.call(null),
      child: Icon(
        Icons.close,
        size: _getCloseButtonSize(),
        color: _getTextColor().withValues(alpha: 0.8),
      ),
    );
  }

  /// Gets chip height based on size
  double _getHeight() {
    switch (size) {
      case ChipSize.sm:
        return 24;
      case ChipSize.md:
        return 32;
      case ChipSize.lg:
        return 40;
    }
  }

  /// Gets font size based on chip size
  double _getFontSize() {
    switch (size) {
      case ChipSize.sm:
        return 12;
      case ChipSize.md:
        return 14;
      case ChipSize.lg:
        return 16;
    }
  }

  /// Gets dot indicator size based on chip size
  double _getDotSize() {
    switch (size) {
      case ChipSize.sm:
        return 6;
      case ChipSize.md:
        return 8;
      case ChipSize.lg:
        return 10;
    }
  }

  /// Gets avatar size based on chip size
  double _getAvatarSize() {
    switch (size) {
      case ChipSize.sm:
        return 16;
      case ChipSize.md:
        return 20;
      case ChipSize.lg:
        return 24;
    }
  }

  /// Gets close button size based on chip size
  double _getCloseButtonSize() {
    switch (size) {
      case ChipSize.sm:
        return 12;
      case ChipSize.md:
        return 14;
      case ChipSize.lg:
        return 16;
    }
  }

  /// Gets chip border radius
  BorderRadius _getBorderRadius() {
    switch (radius) {
      case ChipRadius.none:
        return BorderRadius.zero;
      case ChipRadius.sm:
        return BorderRadius.circular(4);
      case ChipRadius.md:
        return BorderRadius.circular(8);
      case ChipRadius.lg:
        return BorderRadius.circular(12);
      case ChipRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  /// Gets chip padding based on size and content
  EdgeInsets _getPadding() {
    switch (size) {
      case ChipSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case ChipSize.md:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ChipSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  /// Gets spacing between content elements
  double _getSpacing() {
    switch (size) {
      case ChipSize.sm:
        return 4;
      case ChipSize.md:
        return 6;
      case ChipSize.lg:
        return 8;
    }
  }

  /// Gets background color based on variant and color
  Color _getBackgroundColor() {
    if (variant == ChipVariant.bordered || variant == ChipVariant.light) {
      return Colors.transparent;
    }

    final baseColor = _getBaseColor();
    final opacity = isDisabled ? 0.5 : 1.0;

    switch (variant) {
      case ChipVariant.solid:
        return baseColor.withValues(alpha: opacity);
      case ChipVariant.flat:
        return baseColor.withValues(alpha: opacity * 0.3);
      case ChipVariant.faded:
        return baseColor.withValues(alpha: opacity * 0.2);
      case ChipVariant.shadow:
        return baseColor.withValues(alpha: opacity);
      case ChipVariant.dot:
        return const Color(0xFFf4f4f5).withValues(alpha: opacity); // zinc-100
      case ChipVariant.bordered:
      case ChipVariant.light:
        return Colors.transparent;
    }
  }

  /// Gets border based on variant
  Border? _getBorder() {
    if (variant == ChipVariant.bordered) {
      return Border.all(
        color: _getBaseColor().withValues(alpha: isDisabled ? 0.3 : 1.0),
      );
    }
    return null;
  }

  /// Gets box shadow based on variant
  List<BoxShadow>? _getBoxShadow() {
    if (variant == ChipVariant.shadow && !isDisabled) {
      return [
        BoxShadow(
          color: _getBaseColor().withValues(alpha: 0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
    }
    return null;
  }

  /// Gets text color based on variant and color
  Color _getTextColor() {
    if (isDisabled) {
      return Colors.grey;
    }

    final baseColor = _getBaseColor();

    switch (variant) {
      case ChipVariant.solid:
      case ChipVariant.shadow:
        return _getContrastColor(baseColor);
      case ChipVariant.bordered:
      case ChipVariant.light:
      case ChipVariant.flat:
      case ChipVariant.faded:
      case ChipVariant.dot:
        return baseColor;
    }
  }

  /// Gets base color based on color enum
  Color _getBaseColor() {
    switch (color) {
      case ChipColor.defaultColor:
        return const Color(0xFF71717a); // zinc-500
      case ChipColor.primary:
        return NextUiColors.primary;
      case ChipColor.secondary:
        return NextUiColors.secondary;
      case ChipColor.success:
        return NextUiColors.success;
      case ChipColor.warning:
        return NextUiColors.warning;
      case ChipColor.danger:
        return NextUiColors.danger;
    }
  }

  /// Gets contrast color for text on colored backgrounds
  Color _getContrastColor(Color backgroundColor) {
    // Calculate luminance to determine if text should be white or black
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
