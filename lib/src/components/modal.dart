import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Modal component
///
/// Displays a dialog with custom content that requires attention or provides
/// additional information.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextModal(
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(
///     header: NextModalHeader(child: Text('Modal Title')),
///     body: NextModalBody(child: Text('Modal content here')),
///     footer: NextModalFooter(
///       child: Row(
///         children: [
///           TextButton(onPressed: () {}, child: Text('Close')),
///           ElevatedButton(onPressed: () {}, child: Text('Action')),
///         ],
///       ),
///     ),
///   ),
/// )
/// ```
///
/// ## Sizes
///
/// ```dart
/// NextModal(
///   size: ModalSize.lg,
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(...),
/// )
/// ```
///
/// ## Placements
///
/// ```dart
/// NextModal(
///   placement: ModalPlacement.top,
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(...),
/// )
/// ```
///
/// ## Non-dismissible
///
/// ```dart
/// NextModal(
///   isDismissable: false,
///   isKeyboardDismissDisabled: true,
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(...),
/// )
/// ```
///
/// ## Backdrop
///
/// ```dart
/// NextModal(
///   backdrop: ModalBackdrop.blur,
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(...),
/// )
/// ```
///
/// ## Scroll Behavior
///
/// ```dart
/// NextModal(
///   scrollBehavior: ModalScrollBehavior.inside,
///   isOpen: true,
///   onClose: () {},
///   child: NextModalContent(...),
/// )
/// ```
class NextModal extends StatefulWidget {
  /// Creates a Next UI Modal
  const NextModal({
    required this.child,
    super.key,
    this.isOpen = false,
    this.size = ModalSize.md,
    this.radius = ModalRadius.lg,
    this.shadow = ModalShadow.lg,
    this.backdrop = ModalBackdrop.opaque,
    this.scrollBehavior = ModalScrollBehavior.normal,
    this.placement = ModalPlacement.auto,
    this.isDismissable = true,
    this.isKeyboardDismissDisabled = false,
    this.shouldBlockScroll = true,
    this.hideCloseButton = false,
    this.closeButton,
    this.disableAnimation = false,
    this.onClose,
    this.onOpenChange,
    this.barrierColor,
    this.barrierLabel,
    this.isDraggable = false,
    this.allowDragOverflow = false,
  });

  /// The modal content
  final Widget child;

  /// Whether the modal is open
  final bool isOpen;

  /// Modal size
  final ModalSize size;

  /// Modal border radius
  final ModalRadius radius;

  /// Modal shadow
  final ModalShadow shadow;

  /// Modal backdrop type
  final ModalBackdrop backdrop;

  /// Modal scroll behavior
  final ModalScrollBehavior scrollBehavior;

  /// Modal placement
  final ModalPlacement placement;

  /// Whether the modal can be dismissed by clicking outside or pressing ESC
  final bool isDismissable;

  /// Whether keyboard dismiss is disabled
  final bool isKeyboardDismissDisabled;

  /// Whether scrolling behind the modal should be blocked
  final bool shouldBlockScroll;

  /// Whether to hide the close button
  final bool hideCloseButton;

  /// Custom close button
  final Widget? closeButton;

  /// Whether animations are disabled
  final bool disableAnimation;

  /// Called when the modal is closed
  final VoidCallback? onClose;

  /// Called when the modal open state changes
  final ValueChanged<bool>? onOpenChange;

  /// Custom barrier color
  final Color? barrierColor;

  /// Barrier label for accessibility
  final String? barrierLabel;

  /// Whether the modal is draggable
  final bool isDraggable;

  /// Whether drag can overflow the viewport
  final bool allowDragOverflow;

  @override
  State<NextModal> createState() => _NextModalState();
}

class _NextModalState extends State<NextModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Offset _dragOffset = Offset.zero;

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
      begin: _getInitialSlideOffset(),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    if (widget.isOpen) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(NextModal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen != oldWidget.isOpen) {
      if (widget.isOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Offset _getInitialSlideOffset() {
    switch (widget.placement) {
      case ModalPlacement.top:
      case ModalPlacement.topCenter:
        return const Offset(0, -1);
      case ModalPlacement.bottom:
      case ModalPlacement.bottomCenter:
        return const Offset(0, 1);
      case ModalPlacement.center:
      case ModalPlacement.auto:
        return const Offset(0, 0.3);
    }
  }

  void _handleDismiss() {
    if (widget.isDismissable) {
      widget.onClose?.call();
      widget.onOpenChange?.call(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isOpen) {
      return const SizedBox.shrink();
    }

    return PopScope(
      canPop: !widget.isKeyboardDismissDisabled && widget.isDismissable,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop && !widget.isKeyboardDismissDisabled) {
          _handleDismiss();
        }
      },
      child: GestureDetector(
        onTap: _handleDismiss,
        child: Material(
          type: MaterialType.transparency,
          child: Stack(
            children: [
              // Backdrop
              _buildBackdrop(),

              // Modal content
              _buildModalContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackdrop() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: GestureDetector(
        onTap: _handleDismiss,
        child: ColoredBox(
          color: _getBackdropColor(),
          child: widget.backdrop == ModalBackdrop.blur
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildModalContent() {
    final modalContent = Center(
      child: _buildAlignedModal(),
    );

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: modalContent,
      ),
    );
  }

  Widget _buildAlignedModal() {
    final alignment = _getAlignment();

    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: _dragOffset,
        child: GestureDetector(
          onTap: () {}, // Prevent dismissal when tapping modal
          child: widget.isDraggable ? _buildDraggableModal() : _buildModal(),
        ),
      ),
    );
  }

  Widget _buildDraggableModal() {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          final newOffset = _dragOffset + details.delta;

          if (widget.allowDragOverflow) {
            _dragOffset = newOffset;
          } else {
            final size = MediaQuery.of(context).size;
            final modalWidth = _getModalWidth(size.width);
            final modalHeight = size.height * 0.8;

            _dragOffset = Offset(
              newOffset.dx.clamp(
                -size.width / 2 + modalWidth / 2,
                size.width / 2 - modalWidth / 2,
              ),
              newOffset.dy.clamp(
                -size.height / 2 + modalHeight / 2,
                size.height / 2 - modalHeight / 2,
              ),
            );
          }
        });
      },
      child: _buildModal(),
    );
  }

  Widget _buildModal() {
    return Container(
      constraints: _getConstraints(),
      margin: _getMargin(),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: _getBorderRadius(),
        boxShadow: _getBoxShadow(),
      ),
      child: ClipRRect(
        borderRadius: _getBorderRadius(),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!widget.hideCloseButton) _buildCloseButton(),
              Flexible(
                child: widget.scrollBehavior == ModalScrollBehavior.inside
                    ? SingleChildScrollView(child: widget.child)
                    : widget.child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: widget.closeButton ??
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _handleDismiss,
              iconSize: 20,
              padding: const EdgeInsets.all(8),
            ),
      ),
    );
  }

  Alignment _getAlignment() {
    final isMobile = MediaQuery.of(context).size.width < 640;

    switch (widget.placement) {
      case ModalPlacement.auto:
        return isMobile ? Alignment.bottomCenter : Alignment.center;
      case ModalPlacement.top:
        return Alignment.topCenter;
      case ModalPlacement.topCenter:
        return Alignment.topCenter;
      case ModalPlacement.center:
        return Alignment.center;
      case ModalPlacement.bottom:
        return Alignment.bottomCenter;
      case ModalPlacement.bottomCenter:
        return Alignment.bottomCenter;
    }
  }

  BoxConstraints _getConstraints() {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 640;

    if (widget.size == ModalSize.full) {
      return BoxConstraints(
        maxWidth: size.width,
        maxHeight: size.height,
      );
    }

    final maxWidth = _getModalWidth(size.width);

    return BoxConstraints(
      maxWidth: maxWidth,
      maxHeight: isMobile ? size.height * 0.9 : size.height * 0.8,
    );
  }

  double _getModalWidth(double screenWidth) {
    final isMobile = screenWidth < 640;

    if (isMobile) {
      return screenWidth * 0.95;
    }

    switch (widget.size) {
      case ModalSize.xs:
        return 320;
      case ModalSize.sm:
        return 384;
      case ModalSize.md:
        return 512;
      case ModalSize.lg:
        return 640;
      case ModalSize.xl:
        return 768;
      case ModalSize.xxl:
        return 896;
      case ModalSize.xxxl:
        return 1024;
      case ModalSize.xxxxl:
        return 1152;
      case ModalSize.xxxxxl:
        return 1280;
      case ModalSize.full:
        return screenWidth;
    }
  }

  EdgeInsets _getMargin() {
    final isMobile = MediaQuery.of(context).size.width < 640;

    if (isMobile) {
      switch (widget.placement) {
        case ModalPlacement.auto:
        case ModalPlacement.bottom:
        case ModalPlacement.bottomCenter:
          return EdgeInsets.zero;
        case ModalPlacement.top:
        case ModalPlacement.topCenter:
          return EdgeInsets.zero;
        case ModalPlacement.center:
          return const EdgeInsets.symmetric(horizontal: 16);
      }
    }

    return const EdgeInsets.all(16);
  }

  BorderRadius _getBorderRadius() {
    switch (widget.radius) {
      case ModalRadius.none:
        return BorderRadius.zero;
      case ModalRadius.sm:
        return BorderRadius.circular(8);
      case ModalRadius.md:
        return BorderRadius.circular(12);
      case ModalRadius.lg:
        return BorderRadius.circular(16);
      case ModalRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  List<BoxShadow> _getBoxShadow() {
    if (widget.shadow == ModalShadow.none) return [];

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final shadowColor = isDark ? Colors.black : Colors.grey.shade300;

    switch (widget.shadow) {
      case ModalShadow.none:
        return [];
      case ModalShadow.sm:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ];
      case ModalShadow.md:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ];
      case ModalShadow.lg:
        return [
          BoxShadow(
            color: shadowColor.withValues(alpha: 0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ];
    }
  }

  Color _getBackdropColor() {
    switch (widget.backdrop) {
      case ModalBackdrop.transparent:
        return Colors.transparent;
      case ModalBackdrop.opaque:
        return Colors.black.withValues(alpha: 0.5);
      case ModalBackdrop.blur:
        return Colors.transparent;
    }
  }
}

/// Modal content wrapper component
class NextModalContent extends StatelessWidget {
  /// Creates a modal content wrapper
  const NextModalContent({
    super.key,
    this.header,
    this.body,
    this.footer,
    this.children,
  });

  /// Modal header
  final Widget? header;

  /// Modal body
  final Widget? body;

  /// Modal footer
  final Widget? footer;

  /// Alternative way to provide content as children
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    final contentChildren = <Widget>[];

    if (header != null) {
      contentChildren.add(header!);
    }

    if (body != null) {
      // Wrap body in Flexible if it's a NextModalBody for proper scrolling
      if (body is NextModalBody) {
        contentChildren.add(Flexible(child: body!));
      } else {
        contentChildren.add(body!);
      }
    }

    if (footer != null) {
      contentChildren.add(footer!);
    }

    if (children != null) {
      contentChildren.addAll(children!);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: contentChildren,
    );
  }
}

/// Modal header component
class NextModalHeader extends StatelessWidget {
  /// Creates a modal header
  const NextModalHeader({
    required this.child,
    super.key,
    this.padding,
  });

  /// Header content
  final Widget child;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleLarge ?? const TextStyle(),
        child: child,
      ),
    );
  }
}

/// Modal body component
class NextModalBody extends StatelessWidget {
  /// Creates a modal body
  const NextModalBody({
    required this.child,
    super.key,
    this.padding,
  });

  /// Body content
  final Widget child;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: padding ?? const EdgeInsets.all(20),
      child: child,
    );
  }
}

/// Modal footer component
class NextModalFooter extends StatelessWidget {
  /// Creates a modal footer
  const NextModalFooter({
    required this.child,
    super.key,
    this.padding,
  });

  /// Footer content
  final Widget child;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          ),
        ),
      ),
      child: child,
    );
  }
}
