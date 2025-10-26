import 'dart:async';

import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Tooltip component
///
/// Tooltips display a brief, informative message that appears when a user
/// interacts with an element.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextTooltip(
///   content: 'This is a tooltip',
///   child: Button.solid(
///     child: Text('Hover me'),
///     onPressed: () {},
///   ),
/// )
/// ```
///
/// ## Colors
///
/// ```dart
/// NextTooltip(
///   content: 'Primary tooltip',
///   color: TooltipColor.primary,
///   child: Icon(Icons.info),
/// )
/// ```
///
/// ## With Arrow
///
/// ```dart
/// NextTooltip(
///   content: 'Tooltip with arrow',
///   showArrow: true,
///   child: Text('Hover me'),
/// )
/// ```
///
/// ## Placements
///
/// ```dart
/// NextTooltip(
///   content: 'Top tooltip',
///   placement: TooltipPlacement.top,
///   child: Icon(Icons.info),
/// )
/// ```
class NextTooltip extends StatefulWidget {
  /// Creates a tooltip
  const NextTooltip({
    required this.content,
    required this.child,
    super.key,
    this.size = TooltipSize.md,
    this.color = TooltipColor.defaultColor,
    this.radius = TooltipRadius.md,
    this.shadow = TooltipShadow.sm,
    this.placement = TooltipPlacement.top,
    this.showArrow = false,
    this.delay = 0,
    this.closeDelay = 500,
    this.offset = 7,
    this.isOpen,
    this.isDisabled = false,
    this.disableAnimation = false,
    this.onOpenChange,
  });

  /// Tooltip content
  final String content;

  /// Child widget
  final Widget child;

  /// Tooltip size
  final TooltipSize size;

  /// Tooltip color
  final TooltipColor color;

  /// Tooltip radius
  final TooltipRadius radius;

  /// Tooltip shadow
  final TooltipShadow shadow;

  /// Tooltip placement
  final TooltipPlacement placement;

  /// Whether to show arrow
  final bool showArrow;

  /// Delay before showing tooltip (milliseconds)
  final int delay;

  /// Delay before hiding tooltip (milliseconds)
  final int closeDelay;

  /// Offset from child widget
  final double offset;

  /// Controlled open state
  final bool? isOpen;

  /// Whether tooltip is disabled
  final bool isDisabled;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Called when open state changes
  final ValueChanged<bool>? onOpenChange;

  @override
  State<NextTooltip> createState() => _NextTooltipState();
}

class _NextTooltipState extends State<NextTooltip>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  bool _isTooltipVisible = false;
  Timer? _showTimer;
  Timer? _hideTimer;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.disableAnimation
          ? Duration.zero
          : const Duration(milliseconds: 200),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void didUpdateWidget(NextTooltip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != null && widget.isOpen != oldWidget.isOpen) {
      if (widget.isOpen!) {
        _showTooltip();
      } else {
        _hideTooltip();
      }
    }
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _hideTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent event) {
    if (widget.isDisabled || widget.isOpen == false) return;

    _hideTimer?.cancel();
    _isHovering = true;

    if (widget.delay > 0) {
      _showTimer = Timer(Duration(milliseconds: widget.delay), () {
        if (_isHovering) {
          _showTooltip();
        }
      });
    } else {
      _showTooltip();
    }
  }

  void _onExit(PointerEvent event) {
    if (widget.isDisabled || (widget.isOpen ?? false)) return;

    _showTimer?.cancel();
    _isHovering = false;

    if (widget.closeDelay > 0) {
      _hideTimer = Timer(Duration(milliseconds: widget.closeDelay), () {
        if (!_isHovering) {
          _hideTooltip();
        }
      });
    } else {
      _hideTooltip();
    }
  }

  void _showTooltip() {
    if (mounted && !_isTooltipVisible) {
      setState(() {
        _isTooltipVisible = true;
      });
      _animationController.forward();
      widget.onOpenChange?.call(true);
    }
  }

  void _hideTooltip() {
    if (mounted && _isTooltipVisible) {
      _animationController.reverse().then((_) {
        if (mounted) {
          setState(() {
            _isTooltipVisible = false;
          });
        }
      });
      widget.onOpenChange?.call(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          widget.child,
          if (_isTooltipVisible || (widget.isOpen ?? false))
            Positioned(
              top: _getTopPosition(),
              bottom: _getBottomPosition(),
              left: _getLeftPosition(),
              right: _getRightPosition(),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: _buildTooltipContent(context),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTooltipContent(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showArrow && _isArrowOnTop()) _buildArrow(theme),
        Container(
          padding: _getPadding(),
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            borderRadius: _getBorderRadius(),
            boxShadow: _getBoxShadow(),
          ),
          child: Text(
            widget.content,
            style: theme.textTheme.bodySmall?.copyWith(
              color: _getTextColor(),
              fontSize: _getFontSize(),
            ),
          ),
        ),
        if (widget.showArrow && !_isArrowOnTop()) _buildArrow(theme),
      ],
    );
  }

  Widget _buildArrow(ThemeData theme) {
    return CustomPaint(
      size: const Size(12, 6),
      painter: _ArrowPainter(
        color: _getBackgroundColor(),
        isPointingUp: !_isArrowOnTop(),
      ),
    );
  }

  bool _isArrowOnTop() {
    switch (widget.placement) {
      case TooltipPlacement.bottom:
      case TooltipPlacement.bottomStart:
      case TooltipPlacement.bottomEnd:
        return true;
      case TooltipPlacement.top:
      case TooltipPlacement.topStart:
      case TooltipPlacement.topEnd:
      case TooltipPlacement.left:
      case TooltipPlacement.leftStart:
      case TooltipPlacement.leftEnd:
      case TooltipPlacement.right:
      case TooltipPlacement.rightStart:
      case TooltipPlacement.rightEnd:
        return false;
    }
  }

  double? _getTopPosition() {
    switch (widget.placement) {
      case TooltipPlacement.bottom:
      case TooltipPlacement.bottomStart:
      case TooltipPlacement.bottomEnd:
        return null;
      case TooltipPlacement.top:
      case TooltipPlacement.topStart:
      case TooltipPlacement.topEnd:
        return -(widget.offset + (widget.showArrow ? 6 : 0));
      case TooltipPlacement.left:
      case TooltipPlacement.leftStart:
      case TooltipPlacement.leftEnd:
      case TooltipPlacement.right:
      case TooltipPlacement.rightStart:
      case TooltipPlacement.rightEnd:
        return 0;
    }
  }

  double? _getBottomPosition() {
    switch (widget.placement) {
      case TooltipPlacement.bottom:
      case TooltipPlacement.bottomStart:
      case TooltipPlacement.bottomEnd:
        return -(widget.offset + (widget.showArrow ? 6 : 0));
      case TooltipPlacement.top:
      case TooltipPlacement.topStart:
      case TooltipPlacement.topEnd:
      case TooltipPlacement.left:
      case TooltipPlacement.leftStart:
      case TooltipPlacement.leftEnd:
      case TooltipPlacement.right:
      case TooltipPlacement.rightStart:
      case TooltipPlacement.rightEnd:
        return null;
    }
  }

  double? _getLeftPosition() {
    switch (widget.placement) {
      case TooltipPlacement.left:
      case TooltipPlacement.leftStart:
      case TooltipPlacement.leftEnd:
        return -(widget.offset + (widget.showArrow ? 6 : 0));
      case TooltipPlacement.right:
      case TooltipPlacement.rightStart:
      case TooltipPlacement.rightEnd:
        return null;
      case TooltipPlacement.top:
      case TooltipPlacement.topStart:
      case TooltipPlacement.bottom:
      case TooltipPlacement.bottomStart:
        return 0;
      case TooltipPlacement.topEnd:
      case TooltipPlacement.bottomEnd:
        return null;
    }
  }

  double? _getRightPosition() {
    switch (widget.placement) {
      case TooltipPlacement.right:
      case TooltipPlacement.rightStart:
      case TooltipPlacement.rightEnd:
        return -(widget.offset + (widget.showArrow ? 6 : 0));
      case TooltipPlacement.left:
      case TooltipPlacement.leftStart:
      case TooltipPlacement.leftEnd:
        return null;
      case TooltipPlacement.top:
      case TooltipPlacement.topEnd:
      case TooltipPlacement.bottom:
      case TooltipPlacement.bottomEnd:
        return 0;
      case TooltipPlacement.topStart:
      case TooltipPlacement.bottomStart:
        return null;
    }
  }

  EdgeInsets _getPadding() {
    switch (widget.size) {
      case TooltipSize.sm:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 4);
      case TooltipSize.md:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case TooltipSize.lg:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    }
  }

  double _getFontSize() {
    switch (widget.size) {
      case TooltipSize.sm:
        return 11;
      case TooltipSize.md:
        return 13;
      case TooltipSize.lg:
        return 14;
    }
  }

  BorderRadius _getBorderRadius() {
    switch (widget.radius) {
      case TooltipRadius.none:
        return BorderRadius.zero;
      case TooltipRadius.sm:
        return BorderRadius.circular(6);
      case TooltipRadius.md:
        return BorderRadius.circular(8);
      case TooltipRadius.lg:
        return BorderRadius.circular(12);
      case TooltipRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  List<BoxShadow> _getBoxShadow() {
    if (widget.shadow == TooltipShadow.none) return [];

    const shadowColor = Colors.black;

    switch (widget.shadow) {
      case TooltipShadow.none:
        return [];
      case TooltipShadow.sm:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
      case TooltipShadow.md:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ];
      case TooltipShadow.lg:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];
    }
  }

  Color _getBackgroundColor() {
    switch (widget.color) {
      case TooltipColor.defaultColor:
        return const Color(0xFF18181B); // zinc-900
      case TooltipColor.primary:
        return NextUiColors.primary;
      case TooltipColor.secondary:
        return NextUiColors.secondary;
      case TooltipColor.success:
        return NextUiColors.success;
      case TooltipColor.warning:
        return NextUiColors.warning;
      case TooltipColor.danger:
        return NextUiColors.danger;
    }
  }

  Color _getTextColor() {
    final backgroundColor = _getBackgroundColor();
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

/// Arrow painter for tooltip
class _ArrowPainter extends CustomPainter {
  _ArrowPainter({
    required this.color,
    required this.isPointingUp,
  });

  final Color color;
  final bool isPointingUp;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isPointingUp) {
      // Arrow pointing up
      path
        ..moveTo(size.width / 2, 0)
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height);
    } else {
      // Arrow pointing down
      path
        ..moveTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width / 2, size.height);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_ArrowPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isPointingUp != isPointingUp;
  }
}
