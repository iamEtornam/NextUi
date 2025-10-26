/// Base enums for Next UI components
library;

/// Next UI Button size
enum ButtonSize {
  /// small button
  sm,

  /// medium button
  md,

  /// large button
  lg,
}

/// Next UI Checkbox size
enum CheckboxSize {
  /// small checkbox
  sm,

  /// medium checkbox
  md,

  /// large checkbox
  lg,
}

/// Next UI Button variant
enum ButtonVariant {
  /// Solid background with contrasting text
  solid,

  /// Bordered with transparent background
  bordered,

  /// Light background with colored text
  light,

  /// Flat with subtle background
  flat,

  /// Faded with low opacity background
  faded,

  /// Shadow with elevation
  shadow,

  /// Ghost with transparent background
  ghost,
}

/// Next UI Chip variant
enum ChipVariant {
  /// Solid background with contrasting text
  solid,

  /// Bordered with transparent background
  bordered,

  /// Light background with colored text
  light,

  /// Flat with subtle background
  flat,

  /// Faded with low opacity background
  faded,

  /// Shadow with elevation
  shadow,

  /// Dot variant with small indicator
  dot,
}

/// Next UI Button color
enum ButtonColor {
  /// Default color
  defaultColor,

  /// Primary brand color
  primary,

  /// Secondary color
  secondary,

  /// Success color
  success,

  /// Warning color
  warning,

  /// Danger color
  danger,
}

/// Next UI Chip color (reusing button colors)
typedef ChipColor = ButtonColor;

/// Next UI Radio color (reusing button colors)
typedef RadioColor = ButtonColor;

/// Next UI Checkbox color (reusing button colors)
typedef CheckboxColor = ButtonColor;

/// Next UI Circular Progress color (reusing button colors)
typedef CircularProgressColor = ButtonColor;

/// Next UI Button radius
enum ButtonRadius {
  /// No border radius
  none,

  /// Small border radius
  sm,

  /// Medium border radius
  md,

  /// Large border radius
  lg,

  /// Full border radius (pill shape)
  full,
}

/// Next UI Chip radius (reusing button radius)
typedef ChipRadius = ButtonRadius;

/// Next UI Chip size (reusing button size)
typedef ChipSize = ButtonSize;

/// Next UI Radio size (reusing button size)
typedef RadioSize = ButtonSize;

/// Next UI Checkbox radius (reusing button radius)
typedef CheckboxRadius = ButtonRadius;

/// Next UI Circular Progress size (reusing button size)
typedef CircularProgressSize = ButtonSize;

/// Next UI RadioGroup orientation
enum RadioGroupOrientation {
  /// Vertical orientation (default)
  vertical,

  /// Horizontal orientation
  horizontal,
}

/// Next UI CheckboxGroup orientation (reusing radio group orientation)
typedef CheckboxGroupOrientation = RadioGroupOrientation;

/// Next UI validation state
enum ValidationState {
  /// Valid state
  valid,

  /// Invalid state
  invalid,
}

/// Next UI validation behavior
enum ValidationBehavior {
  /// Native validation
  native,

  /// ARIA validation
  aria,
}

/// Next UI Spinner placement
enum SpinnerPlacement {
  /// Spinner at the start
  start,

  /// Spinner at the end
  end,
}

/// Card shadow options
enum CardShadow {
  /// No shadow
  none,

  /// Small shadow
  sm,

  /// Medium shadow
  md,

  /// Large shadow
  lg,
}

/// Card radius options
enum CardRadius {
  /// No border radius
  none,

  /// Small border radius
  sm,

  /// Medium border radius
  md,

  /// Large border radius
  lg,
}

/// Card size options
enum CardSize {
  /// Small card size
  sm,

  /// Medium card size
  md,

  /// Large card size
  lg,
}

/// Switch size options
enum SwitchSize {
  /// Small switch size
  sm,

  /// Medium switch size
  md,

  /// Large switch size
  lg,
}

/// Switch color options
enum SwitchColor {
  /// Default color
  defaultColor,

  /// Primary color
  primary,

  /// Secondary color
  secondary,

  /// Success color
  success,

  /// Warning color
  warning,

  /// Danger color
  danger,
}

/// Input variant options
enum InputVariant {
  /// Flat variant
  flat,

  /// Bordered variant
  bordered,

  /// Faded variant
  faded,

  /// Underlined variant
  underlined,
}

/// Input color options
enum InputColor {
  /// Default color
  defaultColor,

  /// Primary color
  primary,

  /// Secondary color
  secondary,

  /// Success color
  success,

  /// Warning color
  warning,

  /// Danger color
  danger,
}

/// Input size options
enum InputSize {
  /// Small input size
  sm,

  /// Medium input size
  md,

  /// Large input size
  lg,
}

/// Input radius options
enum InputRadius {
  /// No border radius
  none,

  /// Small border radius
  sm,

  /// Medium border radius
  md,

  /// Large border radius
  lg,

  /// Full border radius
  full,
}

/// Input label placement options
enum LabelPlacement {
  /// Inside the input
  inside,

  /// Outside above the input
  outside,

  /// Outside to the left of the input
  outsideLeft,
}

/// Badge variant options
enum BadgeVariant {
  /// Solid background with contrasting text
  solid,

  /// Flat with subtle background
  flat,

  /// Faded with low opacity background
  faded,

  /// Shadow with elevation
  shadow,
}

/// Badge color options (reusing button colors)
typedef BadgeColor = ButtonColor;

/// Badge size options (reusing button size)
typedef BadgeSize = ButtonSize;

/// Badge shape options
enum BadgeShape {
  /// Circle shape
  circle,

  /// Rectangle shape
  rectangle,
}

/// Badge placement options
enum BadgePlacement {
  /// Top right corner
  topRight,

  /// Top left corner
  topLeft,

  /// Bottom right corner
  bottomRight,

  /// Bottom left corner
  bottomLeft,
}

/// Avatar color options (reusing button colors)
typedef AvatarColor = ButtonColor;

/// Avatar size options (reusing button size)
typedef AvatarSize = ButtonSize;

/// Avatar radius options (reusing button radius)
typedef AvatarRadius = ButtonRadius;

/// Modal size options
enum ModalSize {
  /// Extra small modal
  xs,

  /// Small modal
  sm,

  /// Medium modal
  md,

  /// Large modal
  lg,

  /// Extra large modal
  xl,

  /// 2X large modal
  xxl,

  /// 3X large modal
  xxxl,

  /// 4X large modal
  xxxxl,

  /// 5X large modal
  xxxxxl,

  /// Full screen modal
  full,
}

/// Modal radius options (reusing button radius)
typedef ModalRadius = ButtonRadius;

/// Modal shadow options (reusing card shadow)
typedef ModalShadow = CardShadow;

/// Modal backdrop options
enum ModalBackdrop {
  /// Transparent backdrop
  transparent,

  /// Opaque backdrop
  opaque,

  /// Blurred backdrop
  blur,
}

/// Modal scroll behavior options
enum ModalScrollBehavior {
  /// Normal scroll behavior
  normal,

  /// Inside scroll behavior
  inside,

  /// Outside scroll behavior
  outside,
}

/// Modal placement options
enum ModalPlacement {
  /// Auto placement (center on desktop, bottom on mobile)
  auto,

  /// Top placement
  top,

  /// Top center placement
  topCenter,

  /// Center placement
  center,

  /// Bottom placement
  bottom,

  /// Bottom center placement
  bottomCenter,
}

/// Dropdown variant options
enum DropdownVariant {
  /// Solid background with contrasting text
  solid,

  /// Bordered with transparent background
  bordered,

  /// Light background with colored text
  light,

  /// Flat with subtle background
  flat,

  /// Faded with low opacity background
  faded,

  /// Shadow with elevation
  shadow,
}

/// Dropdown color options (reusing button colors)
typedef DropdownColor = ButtonColor;

/// Dropdown trigger type
enum DropdownTrigger {
  /// Trigger on press (click/tap)
  press,

  /// Trigger on long press
  longPress,
}

/// Dropdown selection mode
enum DropdownSelectionMode {
  /// No selection allowed
  none,

  /// Single item selection
  single,

  /// Multiple items selection
  multiple,
}

/// Dropdown auto focus option
enum DropdownAutoFocus {
  /// No auto focus
  none,

  /// Focus first item
  first,

  /// Focus last item
  last,
}

/// Toast variant options
enum ToastVariant {
  /// Solid background with contrasting text
  solid,

  /// Bordered with transparent background
  bordered,

  /// Flat with subtle background
  flat,
}

/// Toast color options (reusing button colors)
typedef ToastColor = ButtonColor;

/// Toast radius options (reusing button radius)
typedef ToastRadius = ButtonRadius;

/// Toast placement options
enum ToastPlacement {
  /// Bottom right corner
  bottomRight,

  /// Bottom left corner
  bottomLeft,

  /// Bottom center
  bottomCenter,

  /// Top right corner
  topRight,

  /// Top left corner
  topLeft,

  /// Top center
  topCenter,
}

/// Table selection mode
enum TableSelectionMode {
  /// No selection allowed
  none,

  /// Single row selection
  single,

  /// Multiple rows selection
  multiple,
}

/// Table selection behavior
enum TableSelectionBehavior {
  /// Toggle selection like checkbox
  toggle,

  /// Replace selection on click
  replace,
}

/// Table content placement
enum TableContentPlacement {
  /// Inside the table wrapper
  inside,

  /// Outside the table wrapper
  outside,
}

/// Table column alignment
enum TableColumnAlign {
  /// Start alignment
  start,

  /// Center alignment
  center,

  /// End alignment
  end,
}

/// Tooltip size options
enum TooltipSize {
  /// Small tooltip
  sm,

  /// Medium tooltip
  md,

  /// Large tooltip
  lg,
}

/// Tooltip color options (reusing button colors)
typedef TooltipColor = ButtonColor;

/// Tooltip radius options (reusing button radius)
typedef TooltipRadius = ButtonRadius;

/// Tooltip shadow options (reusing card shadow)
typedef TooltipShadow = CardShadow;

/// Tooltip placement options
enum TooltipPlacement {
  /// Top placement
  top,

  /// Top start
  topStart,

  /// Top end
  topEnd,

  /// Bottom placement
  bottom,

  /// Bottom start
  bottomStart,

  /// Bottom end
  bottomEnd,

  /// Left placement
  left,

  /// Left start
  leftStart,

  /// Left end
  leftEnd,

  /// Right placement
  right,

  /// Right start
  rightStart,

  /// Right end
  rightEnd,
}
