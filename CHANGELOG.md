# 0.1.1

## Added

- **NextAvatar Component**: Avatar component to represent users with profile pictures, initials, or fallback icons. Includes 3 sizes (sm, md, lg), 6 color options, 5 radius options (none, sm, md, lg, full), bordered mode, disabled state, custom initials generation, custom fallback support, and network image caching using cached_network_image
- **NextAvatarGroup Component**: Group multiple avatars with max count limit, total count display, grid/stacked layouts, group-level property inheritance, and custom count rendering
- **NextBadge Component**: Badge indicator for UI elements with multiple variants (solid, flat, faded, shadow), 6 color options, 3 sizes (sm, md, lg), flexible placement (topRight, topLeft, bottomRight, bottomLeft), multiple shapes (circle, rectangle), dot mode, visibility control, animation support, and outline customization
- **NextDropdown Component**: Comprehensive dropdown menu component with trigger support, multiple selection modes (none, single, multiple), variants (solid, bordered, light, flat, faded, shadow), 6 color options, disabled items, sections with dividers, shortcuts, descriptions, start/end content, and keyboard navigation
- **NextDropdownTrigger Component**: Trigger component for opening dropdown menu with press/long-press support
- **NextDropdownMenu Component**: Menu container with item management, selection tracking, and event handling
- **NextDropdownSection Component**: Section grouping for dropdown items with optional titles and dividers
- **NextDropdownItem Component**: Individual dropdown item with title, description, shortcut, icons, selection state, and custom content
- **NextModal Component**: Comprehensive modal dialog component with multiple sizes (xs, sm, md, lg, xl, xxl, xxxl, xxxxl, xxxxxl, full), placement options (auto, top, topCenter, center, bottom, bottomCenter), backdrop types (transparent, opaque, blur), scroll behaviors (normal, inside, outside), dismissible/non-dismissible modes, draggable functionality, custom close button support, and keyboard navigation
- **NextModalContent Component**: Wrapper component for modal content with support for header, body, and footer sections
- **NextModalHeader Component**: Modal header with customizable padding and automatic title styling
- **NextModalBody Component**: Scrollable modal body with flexible content support
- **NextModalFooter Component**: Modal footer for actions with customizable padding
- **NextTable Component**: Comprehensive data table component with column definitions, row selection (single/multiple), sorting support, striped rows, compact mode, sticky header, empty state, custom cell rendering, disabled rows, and flexible layout options
- **TableColumnDef Class**: Column definition class with key, label, alignment, width constraints, sorting support, and custom cell builders
- **TableSortDescriptor Class**: Sort descriptor for managing table sorting state with column key and direction
- **Table Helper Components**: NextTableHeader, NextTableColumn, NextTableBody, NextTableRow, NextTableCell for API compatibility
- **NextToastProvider Component**: Context provider for managing toast notifications with queue management, max visible toasts, placement control, and animation support
- **NextToast Component**: Toast notification widget with 3 variants (solid, bordered, flat), 6 color options, auto-dismiss with timeout, progress indicator, custom icons, close button control, and smooth animations
- **Toast Helper Functions**: Convenience functions (showToast, showSuccessToast, showErrorToast, showWarningToast, showInfoToast) for quick toast creation
- **NextTooltip Component**: Informative tooltip component with 3 sizes (sm, md, lg), 6 color options, 12 placement options, arrow support, custom offset, delay/close delay, controlled state, and smooth animations

## Enhanced

- **NextCard Component**: Flexible card component with header, body, and footer sections, multiple shadow levels (none, sm, md, lg), radius options (none, sm, md, lg), pressable/clickable functionality, and blurred footer effect
- **NextInput Component**: Comprehensive input field with multiple variants (flat, bordered, faded, underlined), validation states, start/end content support, clearable functionality, and accessibility features
- **NextInputOTP Component**: One-Time Password input component with customizable length, completion callbacks, and proper keyboard handling
- **NextSwitch Component**: Toggle switch with multiple sizes (sm, md, lg), colors (primary, secondary, success, warning, danger), labels, and disabled states
- **README Documentation**: Updated with detailed component usage examples and screenshots
- **Example App**: Enhanced with comprehensive component showcases including tabs for each component category
- **Component Organization**: Improved file structure and component exports

# 0.1.0

## Added

- **NextAvatar Component**: Avatar component to represent users with profile pictures, initials, or fallback icons. Includes 3 sizes (sm, md, lg), 6 color options, 5 radius options (none, sm, md, lg, full), bordered mode, disabled state, custom initials generation, custom fallback support, and network image caching using cached_network_image
- **NextAvatarGroup Component**: Group multiple avatars with max count limit, total count display, grid/stacked layouts, group-level property inheritance, and custom count rendering
- **NextBadge Component**: Badge indicator for UI elements with multiple variants (solid, flat, faded, shadow), 6 color options, 3 sizes (sm, md, lg), flexible placement (topRight, topLeft, bottomRight, bottomLeft), multiple shapes (circle, rectangle), dot mode, visibility control, animation support, and outline customization
- **NextCard Component**: Flexible card component with header, body, and footer sections, multiple shadow levels (none, sm, md, lg), radius options (none, sm, md, lg), pressable/clickable functionality, and blurred footer effect
- **NextModal Component**: Comprehensive modal dialog component with multiple sizes (xs, sm, md, lg, xl, xxl, xxxl, xxxxl, xxxxxl, full), placement options (auto, top, topCenter, center, bottom, bottomCenter), backdrop types (transparent, opaque, blur), scroll behaviors (normal, inside, outside), dismissible/non-dismissible modes, draggable functionality, custom close button support, and keyboard navigation
- **NextModalContent Component**: Wrapper component for modal content with support for header, body, and footer sections
- **NextModalHeader Component**: Modal header with customizable padding and automatic title styling
- **NextModalBody Component**: Scrollable modal body with flexible content support
- **NextModalFooter Component**: Modal footer for actions with customizable padding
- **NextDropdown Component**: Comprehensive dropdown menu component with trigger support, multiple selection modes (none, single, multiple), variants (solid, bordered, light, flat, faded, shadow), 6 color options, disabled items, sections with dividers, shortcuts, descriptions, start/end content, and keyboard navigation
- **NextDropdownTrigger Component**: Trigger component for opening dropdown menu with press/long-press support
- **NextDropdownMenu Component**: Menu container with item management, selection tracking, and event handling
- **NextDropdownSection Component**: Section grouping for dropdown items with optional titles and dividers
- **NextDropdownItem Component**: Individual dropdown item with title, description, shortcut, icons, selection state, and custom content
- **NextToastProvider Component**: Context provider for managing toast notifications with queue management, max visible toasts, placement control, and animation support
- **NextToast Component**: Toast notification widget with 3 variants (solid, bordered, flat), 6 color options, auto-dismiss with timeout, progress indicator, custom icons, close button control, and smooth animations
- **Toast Helper Functions**: Convenience functions (showToast, showSuccessToast, showErrorToast, showWarningToast, showInfoToast) for quick toast creation
- **NextTable Component**: Comprehensive data table component with column definitions, row selection (single/multiple), sorting support, striped rows, compact mode, sticky header, empty state, custom cell rendering, disabled rows, and flexible layout options
- **TableColumnDef Class**: Column definition class with key, label, alignment, width constraints, sorting support, and custom cell builders
- **TableSortDescriptor Class**: Sort descriptor for managing table sorting state with column key and direction
- **Table Helper Components**: NextTableHeader, NextTableColumn, NextTableBody, NextTableRow, NextTableCell for API compatibility
- **NextTooltip Component**: Informative tooltip component with 3 sizes (sm, md, lg), 6 color options, 12 placement options, arrow support, custom offset, delay/close delay, controlled state, and smooth animations
- **NextSwitch Component**: Toggle switch with multiple sizes (sm, md, lg), colors (primary, secondary, success, warning, danger), labels, and disabled states
- **NextInput Component**: Comprehensive input field with multiple variants (flat, bordered, faded, underlined), validation states, start/end content support, clearable functionality, and accessibility features
- **NextInputOTP Component**: One-Time Password input component with customizable length, completion callbacks, and proper keyboard handling
- **CardHeader Component**: Dedicated header component for cards with custom padding support
- **CardBody Component**: Card body component with flexible content and custom padding
- **CardFooter Component**: Card footer component with optional blur effect

## Enhanced

- **Input Components**: Major refactoring for better performance and consistency
- **Example App**: Enhanced with comprehensive component showcases including tabs for each component category
- **README Documentation**: Updated with detailed component usage examples and screenshots
- **Component Organization**: Improved file structure and component exports

## Infrastructure

- **Dependencies**: Added cached_network_image (^3.4.1) for efficient network image loading and caching in Avatar component
- **LICENSE Update**: Updated copyright information for 2025
- **Version Management**: Enhanced versioning system and release process
- **Documentation**: Comprehensive component documentation with usage examples
- **Type Safety**: Improved type definitions and nullable handling

## Features

- Enhanced form validation system
- Improved accessibility across all input components
- Better keyboard navigation support
- Consistent focus management
- Advanced card interactions with hover and press states

# 0.0.1+1

## Added

- **Button Component**: Comprehensive button implementation with multiple
  variants (solid, bordered, light, flat, faded, shadow, ghost), colors, sizes,
  radius options, loading states, icons, and disabled states
- **ButtonGroup Component**: Group multiple buttons with consistent styling and
  spacing
- **NextChip Component**: Chip component with unique dot variant, colors, sizes,
  close button, avatar support, and start/end content
- **RadioGroup Component**: Radio button group with controlled/uncontrolled
  state, validation, orientation support (vertical/horizontal), and error
  handling
- **NextRadio Component**: Individual radio button component with colors, sizes,
  and disabled states
- **NextCheckbox Component**: Checkbox with indeterminate state, line-through
  text, custom icons, and animations
- **NextCheckboxGroup Component**: Checkbox group with validation, orientation
  support, and inheritance pattern
- **NextGroupCheckbox Component**: Specialized checkbox for use within checkbox
  groups
- **NextCircularProgress Component**: Circular progress indicator with
  determinate/indeterminate states, custom labels, value formatting, and
  accessibility support

## Infrastructure

- **Base Enums**: Added comprehensive enum system for component variants,
  colors, sizes, and states
- **Type Aliases**: Created consistent type aliases for component properties
- **Export System**: Organized component exports through centralized index file
- **Lint Compliance**: All components follow Flutter/Dart linting standards with
  proper documentation

## Features

- Full HeroUI design system integration
- Consistent animation and transition system
- Comprehensive accessibility support (ARIA labels, screen reader compatibility)
- Flexible theming with NextUiColors integration
- Performance-optimized custom painters for complex UI elements
- Validation system for form components
- Both controlled and uncontrolled component patterns
