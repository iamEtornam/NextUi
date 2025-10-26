import 'dart:async';

import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Toast entry data class
class ToastEntry {
  /// Creates a toast entry
  ToastEntry({
    required this.id,
    this.title,
    this.description,
    this.icon,
    this.color = ToastColor.defaultColor,
    this.variant = ToastVariant.flat,
    this.radius = ToastRadius.md,
    this.timeout = 6000,
    this.hideIcon = false,
    this.hideCloseButton = false,
    this.shouldShowTimeoutProgress = false,
    this.closeIcon,
    this.onClose,
  });

  /// Unique identifier
  final String id;

  /// Toast title
  final String? title;

  /// Toast description
  final String? description;

  /// Toast icon
  final Widget? icon;

  /// Toast color
  final ToastColor color;

  /// Toast variant
  final ToastVariant variant;

  /// Toast radius
  final ToastRadius radius;

  /// Timeout duration in milliseconds
  final int timeout;

  /// Whether to hide icon
  final bool hideIcon;

  /// Whether to hide close button
  final bool hideCloseButton;

  /// Whether to show timeout progress
  final bool shouldShowTimeoutProgress;

  /// Custom close icon
  final Widget? closeIcon;

  /// Called when toast is closed
  final VoidCallback? onClose;
}

/// Toast provider widget that manages toast notifications
class NextToastProvider extends StatefulWidget {
  /// Creates a toast provider
  const NextToastProvider({
    required this.child,
    super.key,
    this.maxVisibleToasts = 3,
    this.placement = ToastPlacement.bottomRight,
    this.disableAnimation = false,
    this.toastOffset = 0,
  });

  /// The child widget
  final Widget child;

  /// Maximum number of visible toasts
  final int maxVisibleToasts;

  /// Toast placement on screen
  final ToastPlacement placement;

  /// Whether to disable animations
  final bool disableAnimation;

  /// Offset from edges in pixels
  final double toastOffset;

  @override
  State<NextToastProvider> createState() => NextToastProviderState();

  /// Get the toast provider state from context
  static NextToastProviderState of(BuildContext context) {
    final state = context.findAncestorStateOfType<NextToastProviderState>();
    assert(
      state != null,
      'NextToastProvider not found in widget tree. '
      'Wrap your app with NextToastProvider.',
    );
    return state!;
  }

  /// Try to get the toast provider state from context
  static NextToastProviderState? maybeOf(BuildContext context) {
    return context.findAncestorStateOfType<NextToastProviderState>();
  }
}

/// Toast provider state
class NextToastProviderState extends State<NextToastProvider> {
  final List<ToastEntry> _toasts = [];
  final Map<String, Timer> _timers = {};

  /// Add a toast notification
  String addToast(ToastEntry toast) {
    setState(() {
      _toasts.add(toast);
    });

    if (toast.timeout > 0) {
      _timers[toast.id] = Timer(
        Duration(milliseconds: toast.timeout),
        () => removeToast(toast.id),
      );
    }

    return toast.id;
  }

  /// Remove a toast by ID
  void removeToast(String id) {
    _timers[id]?.cancel();
    _timers.remove(id);

    setState(() {
      final index = _toasts.indexWhere((t) => t.id == id);
      if (index != -1) {
        _toasts[index].onClose?.call();
        _toasts.removeAt(index);
      }
    });
  }

  /// Clear all toasts
  void clearAllToasts() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    _timers.clear();

    setState(() {
      for (final toast in _toasts) {
        toast.onClose?.call();
      }
      _toasts.clear();
    });
  }

  @override
  void dispose() {
    for (final timer in _timers.values) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_toasts.isNotEmpty)
          Positioned(
            top: _getTopPosition(),
            bottom: _getBottomPosition(),
            left: _getLeftPosition(),
            right: _getRightPosition(),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: _getCrossAxisAlignment(),
                children: _toasts
                    .take(widget.maxVisibleToasts)
                    .map((toast) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: NextToast(
                            toast: toast,
                            onClose: () => removeToast(toast.id),
                            disableAnimation: widget.disableAnimation,
                          ),
                        ),)
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }

  double? _getTopPosition() {
    switch (widget.placement) {
      case ToastPlacement.topRight:
      case ToastPlacement.topLeft:
      case ToastPlacement.topCenter:
        return widget.toastOffset;
      case ToastPlacement.bottomRight:
      case ToastPlacement.bottomLeft:
      case ToastPlacement.bottomCenter:
        return null;
    }
  }

  double? _getBottomPosition() {
    switch (widget.placement) {
      case ToastPlacement.bottomRight:
      case ToastPlacement.bottomLeft:
      case ToastPlacement.bottomCenter:
        return widget.toastOffset;
      case ToastPlacement.topRight:
      case ToastPlacement.topLeft:
      case ToastPlacement.topCenter:
        return null;
    }
  }

  double? _getLeftPosition() {
    switch (widget.placement) {
      case ToastPlacement.topLeft:
      case ToastPlacement.bottomLeft:
        return widget.toastOffset + 16;
      case ToastPlacement.topCenter:
      case ToastPlacement.bottomCenter:
      case ToastPlacement.topRight:
      case ToastPlacement.bottomRight:
        return null;
    }
  }

  double? _getRightPosition() {
    switch (widget.placement) {
      case ToastPlacement.topRight:
      case ToastPlacement.bottomRight:
        return widget.toastOffset + 16;
      case ToastPlacement.topCenter:
      case ToastPlacement.bottomCenter:
      case ToastPlacement.topLeft:
      case ToastPlacement.bottomLeft:
        return null;
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment() {
    switch (widget.placement) {
      case ToastPlacement.topLeft:
      case ToastPlacement.bottomLeft:
        return CrossAxisAlignment.start;
      case ToastPlacement.topCenter:
      case ToastPlacement.bottomCenter:
        return CrossAxisAlignment.center;
      case ToastPlacement.topRight:
      case ToastPlacement.bottomRight:
        return CrossAxisAlignment.end;
    }
  }
}

/// Toast notification widget
class NextToast extends StatefulWidget {
  /// Creates a toast
  const NextToast({
    required this.toast,
    required this.onClose,
    super.key,
    this.disableAnimation = false,
  });

  /// Toast entry data
  final ToastEntry toast;

  /// Called when toast is closed
  final VoidCallback onClose;

  /// Whether to disable animations
  final bool disableAnimation;

  @override
  State<NextToast> createState() => _NextToastState();
}

class _NextToastState extends State<NextToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Timer? _progressTimer;
  double _progress = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.disableAnimation
          ? Duration.zero
          : const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();

    if (widget.toast.shouldShowTimeoutProgress && widget.toast.timeout > 0) {
      _startProgressTimer();
    }
  }

  void _startProgressTimer() {
    const updateInterval = Duration(milliseconds: 50);
    final totalUpdates = widget.toast.timeout / updateInterval.inMilliseconds;
    final increment = 1.0 / totalUpdates;

    _progressTimer = Timer.periodic(updateInterval, (timer) {
      if (mounted) {
        setState(() {
          _progress += increment;
          if (_progress >= 1.0) {
            _progress = 1.0;
            timer.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _progressTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _handleClose() {
    if (widget.disableAnimation) {
      widget.onClose();
    } else {
      _animationController.reverse().then((_) {
        if (mounted) {
          widget.onClose();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: _buildToastContent(context),
      ),
    );
  }

  Widget _buildToastContent(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 400,
      ),
      decoration: BoxDecoration(
        color: _getBackgroundColor(theme),
        border: _getBorder(theme),
        borderRadius: _getBorderRadius(),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.toast.hideIcon && widget.toast.icon != null) ...[
                  IconTheme(
                    data: IconThemeData(
                      color: _getIconColor(theme),
                      size: 20,
                    ),
                    child: widget.toast.icon!,
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.toast.title != null)
                        DefaultTextStyle(
                          style: theme.textTheme.titleSmall?.copyWith(
                                color: _getTextColor(theme),
                                fontWeight: FontWeight.w600,
                              ) ??
                              const TextStyle(),
                          child: Text(widget.toast.title!),
                        ),
                      if (widget.toast.description != null) ...[
                        const SizedBox(height: 4),
                        DefaultTextStyle(
                          style: theme.textTheme.bodySmall?.copyWith(
                                color:
                                    _getTextColor(theme).withValues(alpha: 0.8),
                              ) ??
                              const TextStyle(),
                          child: Text(widget.toast.description!),
                        ),
                      ],
                    ],
                  ),
                ),
                if (!widget.toast.hideCloseButton) ...[
                  const SizedBox(width: 12),
                  IconButton(
                    icon: widget.toast.closeIcon ??
                        Icon(
                          Icons.close,
                          size: 18,
                          color: _getTextColor(theme).withValues(alpha: 0.6),
                        ),
                    onPressed: _handleClose,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 18,
                  ),
                ],
              ],
            ),
          ),
          if (widget.toast.shouldShowTimeoutProgress)
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getProgressColor(theme),
              ),
              minHeight: 3,
            ),
        ],
      ),
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    final baseColor = _getBaseColor();

    switch (widget.toast.variant) {
      case ToastVariant.solid:
        return baseColor;
      case ToastVariant.bordered:
        return theme.colorScheme.surface;
      case ToastVariant.flat:
        return baseColor.withValues(alpha: 0.15);
    }
  }

  Border? _getBorder(ThemeData theme) {
    if (widget.toast.variant == ToastVariant.bordered) {
      return Border.all(
        color: _getBaseColor(),
        width: 1.5,
      );
    }
    return null;
  }

  BorderRadius _getBorderRadius() {
    switch (widget.toast.radius) {
      case ToastRadius.none:
        return BorderRadius.zero;
      case ToastRadius.sm:
        return BorderRadius.circular(8);
      case ToastRadius.md:
        return BorderRadius.circular(12);
      case ToastRadius.lg:
        return BorderRadius.circular(16);
      case ToastRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  Color _getTextColor(ThemeData theme) {
    switch (widget.toast.variant) {
      case ToastVariant.solid:
        return _getContrastColor(_getBaseColor());
      case ToastVariant.bordered:
      case ToastVariant.flat:
        return theme.textTheme.bodyMedium?.color ?? Colors.black;
    }
  }

  Color _getIconColor(ThemeData theme) {
    switch (widget.toast.variant) {
      case ToastVariant.solid:
        return _getContrastColor(_getBaseColor());
      case ToastVariant.bordered:
      case ToastVariant.flat:
        return _getBaseColor();
    }
  }

  Color _getProgressColor(ThemeData theme) {
    switch (widget.toast.variant) {
      case ToastVariant.solid:
        return _getContrastColor(_getBaseColor()).withValues(alpha: 0.5);
      case ToastVariant.bordered:
      case ToastVariant.flat:
        return _getBaseColor();
    }
  }

  Color _getBaseColor() {
    switch (widget.toast.color) {
      case ToastColor.defaultColor:
        return const Color(0xFF71717a);
      case ToastColor.primary:
        return NextUiColors.primary;
      case ToastColor.secondary:
        return NextUiColors.secondary;
      case ToastColor.success:
        return NextUiColors.success;
      case ToastColor.warning:
        return NextUiColors.warning;
      case ToastColor.danger:
        return NextUiColors.danger;
    }
  }

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

/// Helper function to show a toast
String showToast(
  BuildContext context, {
  String? title,
  String? description,
  Widget? icon,
  ToastColor color = ToastColor.defaultColor,
  ToastVariant variant = ToastVariant.flat,
  ToastRadius radius = ToastRadius.md,
  int timeout = 6000,
  bool hideIcon = false,
  bool hideCloseButton = false,
  bool shouldShowTimeoutProgress = false,
  Widget? closeIcon,
  VoidCallback? onClose,
}) {
  final provider = NextToastProvider.of(context);
  final id = DateTime.now().millisecondsSinceEpoch.toString();

  return provider.addToast(
    ToastEntry(
      id: id,
      title: title,
      description: description,
      icon: icon,
      color: color,
      variant: variant,
      radius: radius,
      timeout: timeout,
      hideIcon: hideIcon,
      hideCloseButton: hideCloseButton,
      shouldShowTimeoutProgress: shouldShowTimeoutProgress,
      closeIcon: closeIcon,
      onClose: onClose,
    ),
  );
}

/// Helper function to show a success toast
String showSuccessToast(
  BuildContext context, {
  required String title,
  String? description,
  int timeout = 6000,
  bool shouldShowTimeoutProgress = false,
}) {
  return showToast(
    context,
    title: title,
    description: description,
    icon: const Icon(Icons.check_circle),
    color: ToastColor.success,
    timeout: timeout,
    shouldShowTimeoutProgress: shouldShowTimeoutProgress,
  );
}

/// Helper function to show an error toast
String showErrorToast(
  BuildContext context, {
  required String title,
  String? description,
  int timeout = 6000,
  bool shouldShowTimeoutProgress = false,
}) {
  return showToast(
    context,
    title: title,
    description: description,
    icon: const Icon(Icons.error),
    color: ToastColor.danger,
    timeout: timeout,
    shouldShowTimeoutProgress: shouldShowTimeoutProgress,
  );
}

/// Helper function to show a warning toast
String showWarningToast(
  BuildContext context, {
  required String title,
  String? description,
  int timeout = 6000,
  bool shouldShowTimeoutProgress = false,
}) {
  return showToast(
    context,
    title: title,
    description: description,
    icon: const Icon(Icons.warning),
    color: ToastColor.warning,
    timeout: timeout,
    shouldShowTimeoutProgress: shouldShowTimeoutProgress,
  );
}

/// Helper function to show an info toast
String showInfoToast(
  BuildContext context, {
  required String title,
  String? description,
  int timeout = 6000,
  bool shouldShowTimeoutProgress = false,
}) {
  return showToast(
    context,
    title: title,
    description: description,
    icon: const Icon(Icons.info),
    color: ToastColor.primary,
    timeout: timeout,
    shouldShowTimeoutProgress: shouldShowTimeoutProgress,
  );
}
