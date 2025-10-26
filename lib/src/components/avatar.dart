import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Next UI Avatar component
///
/// The Avatar component is used to represent a user, and displays the
/// profile picture, initials or fallback icon.
/// Following HeroUI design patterns with comprehensive customization options.
///
/// ## Basic Usage
///
/// ```dart
/// NextAvatar(
///   src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
/// )
/// ```
///
/// ## Sizes
///
/// ```dart
/// NextAvatar(
///   size: AvatarSize.sm,
///   src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
/// )
///
/// NextAvatar(
///   size: AvatarSize.lg,
///   src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
/// )
/// ```
///
/// ## Colors
///
/// ```dart
/// NextAvatar(
///   color: AvatarColor.primary,
///   name: 'John Doe',
/// )
///
/// NextAvatar(
///   color: AvatarColor.success,
///   name: 'Jane Smith',
/// )
/// ```
///
/// ## With Initials
///
/// ```dart
/// NextAvatar(
///   name: 'John Doe',
///   showFallback: true,
/// )
/// ```
///
/// ## Bordered
///
/// ```dart
/// NextAvatar(
///   isBordered: true,
///   src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
/// )
/// ```
///
/// ## Disabled
///
/// ```dart
/// NextAvatar(
///   isDisabled: true,
///   src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
/// )
/// ```
///
/// ## Custom Fallback
///
/// ```dart
/// NextAvatar(
///   fallback: Icon(Icons.person),
///   showFallback: true,
/// )
/// ```
class NextAvatar extends StatelessWidget {
  /// Creates a Next UI Avatar
  const NextAvatar({
    super.key,
    this.src,
    this.name,
    this.icon,
    this.fallback,
    this.color = AvatarColor.defaultColor,
    this.radius = AvatarRadius.full,
    this.size = AvatarSize.md,
    this.isBordered = false,
    this.isDisabled = false,
    this.isFocusable = false,
    this.showFallback = false,
    this.getInitials,
  });

  /// Image source URL
  final String? src;

  /// Name to generate initials from
  final String? name;

  /// Custom icon to display
  final Widget? icon;

  /// Custom fallback widget
  final Widget? fallback;

  /// Avatar color (default, primary, secondary, success, warning, danger)
  final AvatarColor color;

  /// Avatar border radius (none, sm, md, lg, full)
  final AvatarRadius radius;

  /// Avatar size (sm, md, lg)
  final AvatarSize size;

  /// Whether the avatar has a border
  final bool isBordered;

  /// Whether the avatar is disabled
  final bool isDisabled;

  /// Whether the avatar is focusable
  final bool isFocusable;

  /// Whether to show fallback when image fails to load
  final bool showFallback;

  /// Custom function to generate initials from name
  final String Function(String name)? getInitials;

  @override
  Widget build(BuildContext context) {
    final avatarSize = _getSize();

    Widget content;
    if (src != null && src!.isNotEmpty) {
      content = _buildImage();
    } else if (showFallback) {
      content = _buildFallback();
    } else {
      content = const SizedBox.shrink();
    }

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
        border: isBordered ? _getBorder() : null,
        color: _getBackgroundColor(),
      ),
      child: ClipRRect(
        borderRadius: _getBorderRadius(),
        child: Opacity(
          opacity: isDisabled ? 0.5 : 1.0,
          child: content,
        ),
      ),
    );
  }

  /// Builds the image widget
  Widget _buildImage() {
    if (src == null || src!.isEmpty) {
      return showFallback ? _buildFallback() : const SizedBox.shrink();
    }

    return CachedNetworkImage(
      imageUrl: src!,
      fit: BoxFit.cover,
      placeholder: (context, url) => showFallback
          ? _buildFallback()
          : Center(
              child: SizedBox(
                width: _getSize() * 0.4,
                height: _getSize() * 0.4,
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
      errorWidget: (context, url, error) =>
          showFallback ? _buildFallback() : _buildDefaultIcon(),
    );
  }

  /// Builds the fallback widget (initials, custom fallback, or icon)
  Widget _buildFallback() {
    if (fallback != null) {
      return Center(child: fallback);
    }

    if (name != null && name!.isNotEmpty) {
      return _buildInitials();
    }

    if (icon != null) {
      return Center(child: icon);
    }

    return _buildDefaultIcon();
  }

  /// Builds initials from name
  Widget _buildInitials() {
    final initials = getInitials?.call(name!) ?? _defaultGetInitials(name!);

    return Center(
      child: Text(
        initials,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: _getFontSize(),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Default logic to generate initials
  String _defaultGetInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';

    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    }

    return '${parts[0].substring(0, 1)}${parts[1].substring(0, 1)}'
        .toUpperCase();
  }

  /// Builds the default icon
  Widget _buildDefaultIcon() {
    return Center(
      child: Icon(
        Icons.person,
        size: _getIconSize(),
        color: _getTextColor(),
      ),
    );
  }

  /// Gets avatar size in pixels
  double _getSize() {
    switch (size) {
      case AvatarSize.sm:
        return 32;
      case AvatarSize.md:
        return 40;
      case AvatarSize.lg:
        return 56;
    }
  }

  /// Gets font size for initials
  double _getFontSize() {
    switch (size) {
      case AvatarSize.sm:
        return 12;
      case AvatarSize.md:
        return 14;
      case AvatarSize.lg:
        return 20;
    }
  }

  /// Gets icon size
  double _getIconSize() {
    switch (size) {
      case AvatarSize.sm:
        return 16;
      case AvatarSize.md:
        return 20;
      case AvatarSize.lg:
        return 28;
    }
  }

  /// Gets border radius
  BorderRadius _getBorderRadius() {
    switch (radius) {
      case AvatarRadius.none:
        return BorderRadius.zero;
      case AvatarRadius.sm:
        return BorderRadius.circular(4);
      case AvatarRadius.md:
        return BorderRadius.circular(8);
      case AvatarRadius.lg:
        return BorderRadius.circular(12);
      case AvatarRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  /// Gets border
  Border? _getBorder() {
    if (!isBordered) return null;

    return Border.all(
      color: Colors.white,
      width: 2,
    );
  }

  /// Gets background color
  Color _getBackgroundColor() {
    if (src != null && src!.isNotEmpty) {
      return Colors.transparent;
    }

    final baseColor = _getBaseColor();
    return baseColor.withValues(alpha: 0.2);
  }

  /// Gets text color
  Color _getTextColor() {
    return _getBaseColor();
  }

  /// Gets base color based on color enum
  Color _getBaseColor() {
    switch (color) {
      case AvatarColor.defaultColor:
        return const Color(0xFF71717a); // zinc-500
      case AvatarColor.primary:
        return NextUiColors.primary;
      case AvatarColor.secondary:
        return NextUiColors.secondary;
      case AvatarColor.success:
        return NextUiColors.success;
      case AvatarColor.warning:
        return NextUiColors.warning;
      case AvatarColor.danger:
        return NextUiColors.danger;
    }
  }
}

/// Next UI Avatar Group component
///
/// A wrapper component to display a group of avatars.
///
/// ## Basic Usage
///
/// ```dart
/// NextAvatarGroup(
///   children: [
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
///   ],
/// )
/// ```
///
/// ## Max Count
///
/// ```dart
/// NextAvatarGroup(
///   max: 3,
///   children: [
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d'),
///   ],
/// )
/// ```
///
/// ## Grid Layout
///
/// ```dart
/// NextAvatarGroup(
///   isGrid: true,
///   children: [
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
///     NextAvatar(src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d'),
///   ],
/// )
/// ```
class NextAvatarGroup extends StatelessWidget {
  /// Creates a Next UI Avatar Group
  const NextAvatarGroup({
    required this.children,
    super.key,
    this.max = 5,
    this.total,
    this.size,
    this.color,
    this.radius,
    this.isGrid = false,
    this.isDisabled = false,
    this.isBordered = false,
    this.renderCount,
  });

  /// List of avatars to display
  final List<Widget> children;

  /// Maximum number of avatars to display
  final int max;

  /// Total count of avatars (for display purposes)
  final int? total;

  /// Size for all avatars in the group
  final AvatarSize? size;

  /// Color for all avatars in the group
  final AvatarColor? color;

  /// Radius for all avatars in the group
  final AvatarRadius? radius;

  /// Whether to display avatars in a grid layout
  final bool isGrid;

  /// Whether all avatars in the group are disabled
  final bool isDisabled;

  /// Whether all avatars in the group are bordered
  final bool isBordered;

  /// Custom function to render the count
  final Widget Function(int count)? renderCount;

  @override
  Widget build(BuildContext context) {
    if (isGrid) {
      return _buildGridLayout();
    }

    return _buildStackedLayout();
  }

  /// Builds stacked layout (default)
  Widget _buildStackedLayout() {
    final visibleChildren = children.take(max).toList();
    final remainingCount = (total ?? children.length) - max;

    return SizedBox(
      height: _getAvatarSize(),
      child: Stack(
        children: [
          ...List.generate(visibleChildren.length, (index) {
            return Positioned(
              left: index * (_getAvatarSize() * 0.7),
              child: _wrapWithGroupProps(visibleChildren[index]),
            );
          }),
          if (remainingCount > 0)
            Positioned(
              left: visibleChildren.length * (_getAvatarSize() * 0.7),
              child: _buildCountAvatar(remainingCount),
            ),
        ],
      ),
    );
  }

  /// Builds grid layout
  Widget _buildGridLayout() {
    final visibleChildren = children.take(max).toList();
    final remainingCount = (total ?? children.length) - max;

    final gridChildren = [
      ...visibleChildren.map(_wrapWithGroupProps),
      if (remainingCount > 0) _buildCountAvatar(remainingCount),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: gridChildren,
    );
  }

  /// Wraps avatar with group properties
  Widget _wrapWithGroupProps(Widget avatar) {
    if (avatar is! NextAvatar) return avatar;

    return NextAvatar(
      src: avatar.src,
      name: avatar.name,
      icon: avatar.icon,
      fallback: avatar.fallback,
      color: color ?? avatar.color,
      radius: radius ?? avatar.radius,
      size: size ?? avatar.size,
      isBordered: isBordered || avatar.isBordered,
      isDisabled: isDisabled || avatar.isDisabled,
      isFocusable: avatar.isFocusable,
      showFallback: avatar.showFallback,
      getInitials: avatar.getInitials,
    );
  }

  /// Builds the count avatar showing remaining avatars
  Widget _buildCountAvatar(int count) {
    if (renderCount != null) {
      return renderCount!(count);
    }

    return Container(
      width: _getAvatarSize(),
      height: _getAvatarSize(),
      decoration: BoxDecoration(
        borderRadius: _getBorderRadius(),
        border: isBordered ? _getBorder() : null,
        color: const Color(0xFFf4f4f5), // zinc-100
      ),
      child: Center(
        child: Text(
          '+$count',
          style: TextStyle(
            color: const Color(0xFF71717a), // zinc-500
            fontSize: _getFontSize(),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// Gets avatar size
  double _getAvatarSize() {
    switch (size ?? AvatarSize.md) {
      case AvatarSize.sm:
        return 32;
      case AvatarSize.md:
        return 40;
      case AvatarSize.lg:
        return 56;
    }
  }

  /// Gets font size for count
  double _getFontSize() {
    switch (size ?? AvatarSize.md) {
      case AvatarSize.sm:
        return 12;
      case AvatarSize.md:
        return 14;
      case AvatarSize.lg:
        return 20;
    }
  }

  /// Gets border radius
  BorderRadius _getBorderRadius() {
    switch (radius ?? AvatarRadius.full) {
      case AvatarRadius.none:
        return BorderRadius.zero;
      case AvatarRadius.sm:
        return BorderRadius.circular(4);
      case AvatarRadius.md:
        return BorderRadius.circular(8);
      case AvatarRadius.lg:
        return BorderRadius.circular(12);
      case AvatarRadius.full:
        return BorderRadius.circular(9999);
    }
  }

  /// Gets border
  Border? _getBorder() {
    if (!isBordered) return null;

    return Border.all(
      color: Colors.white,
      width: 2,
    );
  }
}
