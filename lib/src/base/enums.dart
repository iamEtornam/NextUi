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
