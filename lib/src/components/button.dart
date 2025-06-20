import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Button component
///
/// A comprehensive button widget that supports various variants, colors, sizes,
/// and states following HeroUI design patterns.
///
/// ## Basic Usage
///
/// ```dart
/// Button(
///   onPressed: () => print('Button pressed'),
///   child: Text('Click me'),
/// )
/// ```
///
/// ## Variants
///
/// ```dart
/// // Solid button (default)
/// Button.solid(
///   onPressed: () {},
///   child: Text('Solid'),
/// )
///
/// // Bordered button
/// Button.bordered(
///   onPressed: () {},
///   child: Text('Bordered'),
/// )
///
/// // Light button
/// Button.light(
///   onPressed: () {},
///   child: Text('Light'),
/// )
///
/// // Flat button
/// Button.flat(
///   onPressed: () {},
///   child: Text('Flat'),
/// )
///
/// // Ghost button
/// Button.ghost(
///   onPressed: () {},
///   child: Text('Ghost'),
/// )
/// ```
///
/// ## Colors
///
/// ```dart
/// Button(
///   color: ButtonColor.primary,
///   onPressed: () {},
///   child: Text('Primary'),
/// )
///
/// Button(
///   color: ButtonColor.success,
///   onPressed: () {},
///   child: Text('Success'),
/// )
///
/// Button(
///   color: ButtonColor.danger,
///   onPressed: () {},
///   child: Text('Danger'),
/// )
/// ```
///
/// ## Sizes
///
/// ```dart
/// Button(
///   size: ButtonSize.sm,
///   onPressed: () {},
///   child: Text('Small'),
/// )
///
/// Button(
///   size: ButtonSize.md,
///   onPressed: () {},
///   child: Text('Medium'),
/// )
///
/// Button(
///   size: ButtonSize.lg,
///   onPressed: () {},
///   child: Text('Large'),
/// )
/// ```
///
/// ## Loading State
///
/// ```dart
/// Button(
///   isLoading: true,
///   onPressed: () {},
///   child: Text('Loading...'),
/// )
///
/// // Custom spinner
/// Button(
///   isLoading: true,
///   spinner: Icon(Icons.refresh),
///   onPressed: () {},
///   child: Text('Custom Loading'),
/// )
/// ```
///
/// ## With Icons
///
/// ```dart
/// Button(
///   startContent: Icon(Icons.add),
///   onPressed: () {},
///   child: Text('Add Item'),
/// )
///
/// Button(
///   endContent: Icon(Icons.arrow_forward),
///   onPressed: () {},
///   child: Text('Next'),
/// )
/// ```
///
/// ## Icon Only Button
///
/// ```dart
/// Button.iconOnly(
///   icon: Icon(Icons.favorite),
///   onPressed: () {},
/// )
/// ```
///
/// ## Button Group
///
/// ```dart
/// ButtonGroup(
///   children: [
///     Button(child: Text('Left'), onPressed: () {}),
///     Button(child: Text('Center'), onPressed: () {}),
///     Button(child: Text('Right'), onPressed: () {}),
///   ],
/// )
/// ```
class Button extends StatelessWidget {
  /// Creates a Next UI Button
  const Button({
    super.key,
    this.onPressed,
    this.variant = ButtonVariant.solid,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.spinner,
    this.spinnerPlacement = SpinnerPlacement.start,
    this.isLoading = false,
    this.isDisabled = false,
    this.isIconOnly = false,
    this.fullWidth = false,
    this.disableRipple = false,
    this.disableAnimation = false,
    this.child,
  }) : assert(
          child != null || (startContent != null || endContent != null),
          'Button must have either child or startContent/endContent',
        );

  /// Creates a solid button (default variant)
  const Button.solid({
    required this.onPressed,
    required this.child,
    super.key,
    this.color = ButtonColor.primary,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  })  : variant = ButtonVariant.solid,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = false,
        disableRipple = false,
        disableAnimation = false;

  /// Creates a bordered button
  const Button.bordered({
    required this.onPressed,
    required this.child,
    super.key,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  })  : variant = ButtonVariant.bordered,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = false,
        disableRipple = false,
        disableAnimation = false;

  /// Creates a light button
  const Button.light({
    required this.onPressed,
    required this.child,
    super.key,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  })  : variant = ButtonVariant.light,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = false,
        disableRipple = false,
        disableAnimation = false;

  /// Creates a flat button
  const Button.flat({
    required this.onPressed,
    required this.child,
    super.key,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  })  : variant = ButtonVariant.flat,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = false,
        disableRipple = false,
        disableAnimation = false;

  /// Creates a ghost button
  const Button.ghost({
    required this.onPressed,
    required this.child,
    super.key,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.startContent,
    this.endContent,
    this.isLoading = false,
    this.isDisabled = false,
    this.fullWidth = false,
  })  : variant = ButtonVariant.ghost,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = false,
        disableRipple = false,
        disableAnimation = false;

  /// Creates an icon-only button
  const Button.iconOnly({
    required this.onPressed,
    required Widget icon,
    super.key,
    this.variant = ButtonVariant.solid,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.isLoading = false,
    this.isDisabled = false,
  })  : child = icon,
        startContent = null,
        endContent = null,
        spinner = null,
        spinnerPlacement = SpinnerPlacement.start,
        isIconOnly = true,
        fullWidth = false,
        disableRipple = false,
        disableAnimation = false;

  /// Button press callback
  final VoidCallback? onPressed;

  /// Button variant (solid, bordered, light, flat, faded, shadow, ghost)
  final ButtonVariant variant;

  /// Button color (default, primary, secondary, success, warning, danger)
  final ButtonColor color;

  /// Button size (sm, md, lg)
  final ButtonSize size;

  /// Button border radius (none, sm, md, lg, full)
  final ButtonRadius radius;

  /// Widget to display before the main content
  final Widget? startContent;

  /// Widget to display after the main content
  final Widget? endContent;

  /// Custom spinner widget for loading state
  final Widget? spinner;

  /// Spinner placement (start, end)
  final SpinnerPlacement spinnerPlacement;

  /// Whether the button is in loading state
  final bool isLoading;

  /// Whether the button is disabled
  final bool isDisabled;

  /// Whether the button is icon-only
  final bool isIconOnly;

  /// Whether the button should take full width
  final bool fullWidth;

  /// Whether to disable ripple effect
  final bool disableRipple;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Main button content (typically text)
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isEffectivelyDisabled = isDisabled || isLoading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: _getHeight(),
      child: Material(
        color: _getBackgroundColor(),
        borderRadius: _getBorderRadius(),
        elevation: _getElevation(),
        child: InkWell(
          onTap: isEffectivelyDisabled ? null : onPressed,
          borderRadius: _getBorderRadius(),
          splashFactory: disableRipple ? NoSplash.splashFactory : null,
          child: AnimatedContainer(
            duration: disableAnimation
                ? Duration.zero
                : const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: _getBorderRadius(),
              border: _getBorder(),
              color: _getOverlayColor(),
            ),
            padding: _getPadding(),
            child: _buildContent(),
          ),
        ),
      ),
    );
  }

  /// Builds the button content based on state and configuration
  Widget _buildContent() {
    if (isLoading) {
      return _buildLoadingContent();
    }

    if (isIconOnly) {
      return _buildIconOnlyContent();
    }

    return _buildRegularContent();
  }

  /// Builds content for loading state
  Widget _buildLoadingContent() {
    final loadingSpinner = spinner ?? _buildDefaultSpinner();

    if (spinnerPlacement == SpinnerPlacement.start) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          loadingSpinner,
          if (child != null) ...[
            SizedBox(width: _getSpacing()),
            Opacity(opacity: 0.7, child: child),
          ],
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (child != null) ...[
            Opacity(opacity: 0.7, child: child),
            SizedBox(width: _getSpacing()),
          ],
          loadingSpinner,
        ],
      );
    }
  }

  /// Builds content for icon-only button
  Widget _buildIconOnlyContent() {
    return Center(
      child: startContent ?? endContent ?? child,
    );
  }

  /// Builds content for regular button
  Widget _buildRegularContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (startContent != null) ...[
          startContent!,
          if (child != null) SizedBox(width: _getSpacing()),
        ],
        if (child != null)
          DefaultTextStyle(
            style: TextStyle(
              color: _getTextColor(),
              fontSize: _getFontSize(),
              fontWeight: FontWeight.w500,
            ),
            child: child!,
          ),
        if (endContent != null) ...[
          if (child != null) SizedBox(width: _getSpacing()),
          endContent!,
        ],
      ],
    );
  }

  /// Builds the default loading spinner
  Widget _buildDefaultSpinner() {
    return SizedBox(
      width: _getSpinnerSize(),
      height: _getSpinnerSize(),
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
      ),
    );
  }

  /// Gets button height based on size
  double _getHeight() {
    switch (size) {
      case ButtonSize.sm:
        return 32;
      case ButtonSize.md:
        return 40;
      case ButtonSize.lg:
        return 48;
    }
  }

  /// Gets font size based on button size
  double _getFontSize() {
    switch (size) {
      case ButtonSize.sm:
        return 12;
      case ButtonSize.md:
        return 14;
      case ButtonSize.lg:
        return 16;
    }
  }

  /// Gets button border radius
  BorderRadius _getBorderRadius() {
    switch (radius) {
      case ButtonRadius.none:
        return BorderRadius.zero;
      case ButtonRadius.sm:
        return BorderRadius.circular(4);
      case ButtonRadius.md:
        return BorderRadius.circular(8);
      case ButtonRadius.lg:
        return BorderRadius.circular(12);
      case ButtonRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  /// Gets button padding based on size and content
  EdgeInsets _getPadding() {
    if (isIconOnly) {
      switch (size) {
        case ButtonSize.sm:
          return const EdgeInsets.all(6);
        case ButtonSize.md:
          return const EdgeInsets.all(8);
        case ButtonSize.lg:
          return const EdgeInsets.all(10);
      }
    }

    switch (size) {
      case ButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case ButtonSize.md:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case ButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    }
  }

  /// Gets spacing between content elements
  double _getSpacing() {
    switch (size) {
      case ButtonSize.sm:
        return 6;
      case ButtonSize.md:
        return 8;
      case ButtonSize.lg:
        return 10;
    }
  }

  /// Gets spinner size based on button size
  double _getSpinnerSize() {
    switch (size) {
      case ButtonSize.sm:
        return 14;
      case ButtonSize.md:
        return 16;
      case ButtonSize.lg:
        return 18;
    }
  }

  /// Gets background color based on variant and color
  Color _getBackgroundColor() {
    if (variant == ButtonVariant.bordered ||
        variant == ButtonVariant.light ||
        variant == ButtonVariant.ghost) {
      return Colors.transparent;
    }

    final baseColor = _getBaseColor();
    final opacity = isDisabled ? 0.5 : 1.0;

    switch (variant) {
      case ButtonVariant.solid:
        return baseColor.withValues(alpha: opacity);
      case ButtonVariant.flat:
        return baseColor.withValues(alpha: opacity * 0.3);
      case ButtonVariant.faded:
        return baseColor.withValues(alpha: opacity * 0.2);
      case ButtonVariant.shadow:
        return baseColor.withValues(alpha: opacity);
      case ButtonVariant.bordered:
      case ButtonVariant.light:
      case ButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  /// Gets overlay color for certain variants
  Color? _getOverlayColor() {
    if (variant == ButtonVariant.light) {
      return _getBaseColor().withValues(alpha: 0.1);
    }
    return null;
  }

  /// Gets border based on variant
  Border? _getBorder() {
    if (variant == ButtonVariant.bordered) {
      return Border.all(
        color: _getBaseColor().withValues(alpha: isDisabled ? 0.3 : 1.0),
      );
    }
    return null;
  }

  /// Gets elevation based on variant
  double _getElevation() {
    if (variant == ButtonVariant.shadow && !isDisabled) {
      return 4;
    }
    return 0;
  }

  /// Gets text color based on variant and color
  Color _getTextColor() {
    if (isDisabled) {
      return Colors.grey;
    }

    final baseColor = _getBaseColor();

    switch (variant) {
      case ButtonVariant.solid:
      case ButtonVariant.shadow:
        return _getContrastColor(baseColor);
      case ButtonVariant.bordered:
      case ButtonVariant.light:
      case ButtonVariant.flat:
      case ButtonVariant.faded:
      case ButtonVariant.ghost:
        return baseColor;
    }
  }

  /// Gets base color based on color enum
  Color _getBaseColor() {
    switch (color) {
      case ButtonColor.defaultColor:
        return const Color(0xFF71717a); // zinc-500
      case ButtonColor.primary:
        return NextUiColors.primary;
      case ButtonColor.secondary:
        return NextUiColors.secondary;
      case ButtonColor.success:
        return NextUiColors.success;
      case ButtonColor.warning:
        return NextUiColors.warning;
      case ButtonColor.danger:
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

/// Next UI Button Group component
///
/// A widget that groups multiple buttons together with consistent styling
class ButtonGroup extends StatelessWidget {
  /// Creates a Next UI Button Group
  const ButtonGroup({
    required this.children,
    super.key,
    this.variant = ButtonVariant.solid,
    this.color = ButtonColor.defaultColor,
    this.size = ButtonSize.md,
    this.radius = ButtonRadius.md,
    this.isDisabled = false,
    this.fullWidth = false,
  });

  /// List of buttons to group together
  final List<Widget> children;

  /// Button variant applied to all buttons
  final ButtonVariant variant;

  /// Button color applied to all buttons
  final ButtonColor color;

  /// Button size applied to all buttons
  final ButtonSize size;

  /// Button border radius applied to all buttons
  final ButtonRadius radius;

  /// Whether all buttons should be disabled
  final bool isDisabled;

  /// Whether the button group should take full width
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        children: _buildGroupedButtons(),
      ),
    );
  }

  /// Builds buttons with proper grouping styling
  List<Widget> _buildGroupedButtons() {
    final groupedButtons = <Widget>[];

    for (var i = 0; i < children.length; i++) {
      final child = children[i];
      final isFirst = i == 0;
      final isLast = i == children.length - 1;

      // Apply group styling if the child is a Button
      if (child is Button) {
        final modifiedButton = Button(
          key: child.key,
          onPressed: isDisabled ? null : child.onPressed,
          variant: variant,
          color: color,
          size: size,
          radius: _getGroupedRadius(isFirst, isLast),
          startContent: child.startContent,
          endContent: child.endContent,
          spinner: child.spinner,
          spinnerPlacement: child.spinnerPlacement,
          isLoading: child.isLoading,
          isDisabled: child.isDisabled || isDisabled,
          isIconOnly: child.isIconOnly,
          fullWidth: fullWidth && children.length == 1,
          disableRipple: child.disableRipple,
          disableAnimation: child.disableAnimation,
          child: child.child,
        );

        if (fullWidth) {
          groupedButtons.add(Expanded(child: modifiedButton));
        } else {
          groupedButtons.add(modifiedButton);
        }
      } else {
        // If it's not a Button, just add it as is
        if (fullWidth) {
          groupedButtons.add(Expanded(child: child));
        } else {
          groupedButtons.add(child);
        }
      }
    }

    return groupedButtons;
  }

  /// Gets appropriate border radius for grouped buttons
  ButtonRadius _getGroupedRadius(bool isFirst, bool isLast) {
    if (children.length == 1) {
      return radius;
    }

    if (isFirst) {
      return _getLeftRadius();
    } else if (isLast) {
      return _getRightRadius();
    } else {
      return ButtonRadius.none;
    }
  }

  /// Gets left-only border radius
  ButtonRadius _getLeftRadius() {
    // For grouped buttons, we typically want smaller radius on grouped sides
    switch (radius) {
      case ButtonRadius.none:
        return ButtonRadius.none;
      case ButtonRadius.sm:
      case ButtonRadius.md:
      case ButtonRadius.lg:
      case ButtonRadius.full:
        return ButtonRadius.sm;
    }
  }

  /// Gets right-only border radius
  ButtonRadius _getRightRadius() {
    // For grouped buttons, we typically want smaller radius on grouped sides
    switch (radius) {
      case ButtonRadius.none:
        return ButtonRadius.none;
      case ButtonRadius.sm:
      case ButtonRadius.md:
      case ButtonRadius.lg:
      case ButtonRadius.full:
        return ButtonRadius.sm;
    }
  }
}
