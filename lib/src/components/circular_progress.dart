import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:next_ui/src/base/colors.dart';
import 'package:next_ui/src/base/enums.dart';

/// A circular progress indicator widget following HeroUI design principles.
///
/// Circular progress indicators are utilized to indicate an undetermined wait
/// period or visually represent the duration of a process.
///
/// Example:
/// ```dart
/// NextCircularProgress(
///   value: 0.7,
///   label: 'Loading...',
///   showValueLabel: true,
/// )
/// ```
class NextCircularProgress extends StatefulWidget {
  /// Creates a Next UI circular progress component
  const NextCircularProgress({
    super.key,
    this.label,
    this.size = CircularProgressSize.md,
    this.color = CircularProgressColor.primary,
    this.value,
    this.valueLabel,
    this.minValue = 0,
    this.maxValue = 100,
    this.formatOptions,
    this.isIndeterminate = true,
    this.showValueLabel = true,
    this.strokeWidth = 2,
    this.isDisabled = false,
    this.disableAnimation = false,
    this.classNames,
    this.ariaLabel,
  });

  /// The label text to display below the progress
  final Widget? label;

  /// The size of the circular progress
  final CircularProgressSize size;

  /// The color theme of the circular progress
  final CircularProgressColor color;

  /// The current progress value (0.0 to 1.0)
  final double? value;

  /// Custom value label to display in the center
  final Widget? valueLabel;

  /// The minimum value (default: 0)
  final double minValue;

  /// The maximum value (default: 100)
  final double maxValue;

  /// Number formatting options for value display
  final Map<String, dynamic>? formatOptions;

  /// Whether the progress is indeterminate
  final bool isIndeterminate;

  /// Whether to show the value label in the center
  final bool showValueLabel;

  /// The width of the progress stroke
  final double strokeWidth;

  /// Whether the progress is disabled
  final bool isDisabled;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Custom CSS classes for different parts of the circular progress
  final Map<String, String>? classNames;

  /// ARIA label for accessibility
  final String? ariaLabel;

  @override
  State<NextCircularProgress> createState() => _NextCircularProgressState();
}

class _NextCircularProgressState extends State<NextCircularProgress>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      duration: widget.disableAnimation
          ? Duration.zero
          : const Duration(milliseconds: 1000),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_rotationController);

    if (widget.isIndeterminate && !widget.disableAnimation) {
      _rotationController.repeat();
    }
  }

  @override
  void didUpdateWidget(NextCircularProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isIndeterminate != oldWidget.isIndeterminate) {
      if (widget.isIndeterminate && !widget.disableAnimation) {
        _rotationController.repeat();
      } else {
        _rotationController.stop();
      }
    }
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  MaterialColor _getColorScheme() {
    switch (widget.color) {
      case CircularProgressColor.primary:
        return NextUiColors.primary;
      case CircularProgressColor.secondary:
        return NextUiColors.secondary;
      case CircularProgressColor.success:
        return NextUiColors.success;
      case CircularProgressColor.warning:
        return NextUiColors.warning;
      case CircularProgressColor.danger:
        return NextUiColors.danger;
      case CircularProgressColor.defaultColor:
        return NextUiColors.primary;
    }
  }

  double _getSizeValue() {
    switch (widget.size) {
      case CircularProgressSize.sm:
        return 32;
      case CircularProgressSize.md:
        return 40;
      case CircularProgressSize.lg:
        return 48;
    }
  }

  double _getProgress() {
    if (widget.isIndeterminate || widget.value == null) return 0;
    final normalizedValue =
        (widget.value! - widget.minValue) / (widget.maxValue - widget.minValue);
    return normalizedValue.clamp(0.0, 1.0);
  }

  String _getFormattedValue() {
    if (widget.value == null) return '';

    final progress = _getProgress();
    final percentage = progress * 100;

    // Default to percentage formatting
    final formatStyle = widget.formatOptions?['style'] ?? 'percent';

    if (formatStyle == 'percent') {
      return '${percentage.round()}%';
    } else {
      return widget.value!.round().toString();
    }
  }

  Widget _buildValueLabel() {
    if (!widget.showValueLabel) return const SizedBox.shrink();

    if (widget.valueLabel != null) {
      return widget.valueLabel!;
    }

    if (widget.isIndeterminate) return const SizedBox.shrink();

    return Text(
      _getFormattedValue(),
      style: TextStyle(
        fontSize: widget.size == CircularProgressSize.sm
            ? 10
            : widget.size == CircularProgressSize.md
                ? 12
                : 14,
        fontWeight: FontWeight.w500,
        color: widget.isDisabled
            ? Colors.grey.shade400
            : _getColorScheme().shade700,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = _getColorScheme();
    final size = _getSizeValue();
    final progress = _getProgress();

    return Semantics(
      label: widget.ariaLabel ??
          (widget.label is Text
              ? (widget.label! as Text).data
              : 'Progress indicator'),
      value: widget.isIndeterminate ? null : '${(progress * 100).round()}%',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SVG Wrapper (Base container)
          SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Track (background circle)
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.isDisabled
                          ? Colors.grey.shade200
                          : Colors.grey.shade300,
                      width: widget.strokeWidth,
                    ),
                  ),
                ),

                // Indicator (progress circle)
                if (widget.isIndeterminate)
                  AnimatedBuilder(
                    animation: _rotationAnimation,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: _rotationAnimation.value * 2 * math.pi,
                        child: CustomPaint(
                          size: Size(size, size),
                          painter: _IndeterminateCircularProgressPainter(
                            color: widget.isDisabled
                                ? Colors.grey.shade300
                                : colorScheme.shade500,
                            strokeWidth: widget.strokeWidth,
                          ),
                        ),
                      );
                    },
                  )
                else
                  CustomPaint(
                    size: Size(size, size),
                    painter: _DeterminateCircularProgressPainter(
                      progress: progress,
                      color: widget.isDisabled
                          ? Colors.grey.shade300
                          : colorScheme.shade500,
                      strokeWidth: widget.strokeWidth,
                    ),
                  ),

                // Value label
                _buildValueLabel(),
              ],
            ),
          ),

          // Label
          if (widget.label != null) ...[
            const SizedBox(height: 8),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 14,
                color: widget.isDisabled
                    ? Colors.grey.shade400
                    : Colors.grey.shade700,
              ),
              child: widget.label!,
            ),
          ],
        ],
      ),
    );
  }
}

/// Custom painter for determinate circular progress
class _DeterminateCircularProgressPainter extends CustomPainter {
  const _DeterminateCircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });
  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw progress arc
    const startAngle = -math.pi / 2; // Start from top
    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_DeterminateCircularProgressPainter oldDelegate) {
    return progress != oldDelegate.progress ||
        color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}

/// Custom painter for indeterminate circular progress
class _IndeterminateCircularProgressPainter extends CustomPainter {
  const _IndeterminateCircularProgressPainter({
    required this.color,
    required this.strokeWidth,
  });
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw partial arc for indeterminate state
    const startAngle = -math.pi / 2;
    const sweepAngle = math.pi; // Half circle

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(_IndeterminateCircularProgressPainter oldDelegate) {
    return color != oldDelegate.color || strokeWidth != oldDelegate.strokeWidth;
  }
}

/// Extension to provide data attributes information for styling and testing
extension NextCircularProgressDataAttributes on NextCircularProgress {
  /// Data attributes that would be present on the circular progress element
  Map<String, dynamic> get dataAttributes => {
        'data-indeterminate': isIndeterminate,
        'data-disabled': isDisabled,
      };
}
