# Next UI

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Beautiful, modern and fast Flutter UI library inspired by HeroUI design
principles.

<img src="screenshots/cover.png" width="50%">

## Features ✨

- **🎨 Modern Design**: Components following HeroUI design principles
- **🚀 High Performance**: Optimized for Flutter's rendering engine
- **📱 Responsive**: Works seamlessly across different screen sizes
- **🎯 Type Safe**: Built with strong typing and comprehensive enums
- **🧩 Composable**: Easy to combine and customize components
- **♿ Accessible**: Built with accessibility in mind
- **📖 Well Documented**: Comprehensive documentation and examples

## Installation 💻

**❗ In order to start using Next UI you must have the
[Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
flutter pub add next_ui
```

## Quick Start 🚀

```dart
import 'package:flutter/material.dart';
import 'package:next_ui/next_ui.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Button Examples
              Button.solid(
                child: Text('Primary Button'),
                onPressed: () {},
              ),
              SizedBox(height: 16),
              
              // Switch Example
              NextSwitch(
                isSelected: true,
                label: Text('Enable Feature'),
                onValueChange: (value) {},
              // Input Example
              NextInput(
                label: 'Email',
                placeholder: 'Enter your email',
                startContent: Icon(Icons.email),
              // Switch Example
              NextSwitch(
                isSelected: true,
                label: Text('Enable Feature'),
                onValueChange: (value) {},
              ),
              SizedBox(height: 16),
              
              // Input Example
              NextInput(
                label: 'Email',
                placeholder: 'Enter your email',
                startContent: Icon(Icons.email),
              ),
              SizedBox(height: 16),
              
              // Chip Example
              NextChip.solid(
                child: Text('Success'),
                color: ChipColor.success,
              ),
              SizedBox(height: 16),
              
              // Card Example
              NextCard(
                header: Text('Welcome'),
                body: Text('This is a beautiful card component.'),
                footer: ElevatedButton(
                  onPressed: () {},
                  child: Text('Action'),
                ),
              ),
              SizedBox(height: 16),
              
              // Progress Example
              NextCircularProgress(
                value: 0.7,
                isIndeterminate: false,
                label: Text('70% Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Components Overview 📦

### ✅ Completed Components

| Component             | Features                                                 | Status      |
| --------------------- | -------------------------------------------------------- | ----------- |
| **Avatar**            | 3 sizes, 6 colors, 5 radius, initials, fallbacks, group  | ✅ Complete |
| **Badge**             | 4 variants, 3 sizes, 6 colors, placements, dot mode      | ✅ Complete |
| **Button**            | 7 variants, 3 sizes, 6 colors, loading states, icons     | ✅ Complete |
| **Card**              | Header/body/footer structure, shadows, radius, interactive | ✅ Complete |
| **Chip**              | 7 variants, 3 sizes, 6 colors, closable, avatar support  | ✅ Complete |
| **Switch**            | 3 sizes, 6 colors, label support, icons, disabled states | ✅ Complete |
| **Input**             | 4 variants, 3 sizes, 6 colors, validation, OTP support   | ✅ Complete |
| **Checkbox**          | 3 sizes, 6 colors, indeterminate state, validation       | ✅ Complete |
| **Checkbox Group**    | Multi-selection, validation, orientation control         | ✅ Complete |
| **Radio Group**       | Single selection, validation, horizontal/vertical layout | ✅ Complete |
| **Circular Progress** | Determinate/indeterminate, custom labels, stroke width   | ✅ Complete |
| **Typography**        | H1-H6, paragraph, caption, multiple weights              | ✅ Complete |
| **Modal**             | Multiple sizes, placements, backdrops, draggable, dismissible | ✅ Complete |
| **Dropdown**          | Selection modes, variants, sections, shortcuts, icons    | ✅ Complete |
| **Toast**             | 3 variants, 6 colors, placements, progress, auto-dismiss | ✅ Complete |
| **Table**             | Selection modes, sorting, striped rows, custom cells    | ✅ Complete |
| **Tooltip**           | 3 sizes, 6 colors, 12 placements, arrow, delays         | ✅ Complete |


### 🚧 Roadmap

| Planned Components | Status     |
| ------------------ | ---------- |
| Navbar             | 🔄 Planned |
| Pagination         | 🔄 Planned |
| Dark Mode Support  | 🔄 Planned |

## Component Examples 📚

### Avatar

```dart
// Basic Avatar with Image
NextAvatar(
  src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
);

// Avatar with Initials
NextAvatar(
  name: 'John Doe',
  showFallback: true,
);

// Avatar Sizes
NextAvatar(
  size: AvatarSize.sm,
  name: 'Small',
  showFallback: true,
);
NextAvatar(
  size: AvatarSize.md,
  name: 'Medium',
  showFallback: true,
);
NextAvatar(
  size: AvatarSize.lg,
  name: 'Large',
  showFallback: true,
);

// Avatar Colors
NextAvatar(
  color: AvatarColor.primary,
  name: 'Primary',
  showFallback: true,
);
NextAvatar(
  color: AvatarColor.success,
  name: 'Success',
  showFallback: true,
);
NextAvatar(
  color: AvatarColor.danger,
  name: 'Danger',
  showFallback: true,
);

// Bordered Avatar
NextAvatar(
  isBordered: true,
  src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
);

// Disabled Avatar
NextAvatar(
  isDisabled: true,
  src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
);

// Avatar with Custom Icon
NextAvatar(
  icon: Icon(Icons.person),
  showFallback: true,
);

// Avatar with Custom Fallback
NextAvatar(
  fallback: Icon(Icons.star, color: Colors.amber),
  showFallback: true,
);

// Avatar with Different Radius
NextAvatar(
  radius: AvatarRadius.none,
  name: 'Square',
  showFallback: true,
);
NextAvatar(
  radius: AvatarRadius.sm,
  name: 'Small Radius',
  showFallback: true,
);
NextAvatar(
  radius: AvatarRadius.full,
  name: 'Full Radius',
  showFallback: true,
);

// Avatar Group
NextAvatarGroup(
  children: [
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
  ],
);

// Avatar Group with Max Count
NextAvatarGroup(
  max: 3,
  children: [
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026704d'),
  ],
);

// Avatar Group with Total Count
NextAvatarGroup(
  max: 3,
  total: 10,
  children: [
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
  ],
);

// Avatar Group Grid Layout
NextAvatarGroup(
  isGrid: true,
  children: [
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a04258114e29026702d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d'),
    NextAvatar(src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d'),
  ],
);

// Avatar Group with Custom Properties
NextAvatarGroup(
  size: AvatarSize.lg,
  color: AvatarColor.primary,
  isBordered: true,
  children: [
    NextAvatar(name: 'John Doe', showFallback: true),
    NextAvatar(name: 'Jane Smith', showFallback: true),
    NextAvatar(name: 'Bob Johnson', showFallback: true),
  ],
);
```

### Badge

```dart
// Basic Badge
NextBadge(
  content: '5',
  child: Icon(Icons.notifications),
);

// Variants
NextBadge.solid(
  content: '10',
  child: Icon(Icons.mail),
);
NextBadge.flat(
  content: 'New',
  child: Icon(Icons.notifications),
);
NextBadge.faded(
  content: '99+',
  child: Icon(Icons.message),
);
NextBadge.shadow(
  content: '3',
  child: Icon(Icons.shopping_cart),
);

// Colors
NextBadge(
  color: BadgeColor.primary,
  content: '5',
  child: Icon(Icons.notifications),
);
NextBadge(
  color: BadgeColor.success,
  content: 'New',
  child: Icon(Icons.mail),
);
NextBadge(
  color: BadgeColor.danger,
  content: '99+',
  child: Icon(Icons.message),
);

// Sizes
NextBadge(
  size: BadgeSize.sm,
  content: '5',
  child: Icon(Icons.notifications),
);
NextBadge(
  size: BadgeSize.md,
  content: '10',
  child: Icon(Icons.mail),
);
NextBadge(
  size: BadgeSize.lg,
  content: '15',
  child: Icon(Icons.message),
);

// Placements
NextBadge(
  placement: BadgePlacement.topRight,
  content: '5',
  child: Icon(Icons.notifications),
);
NextBadge(
  placement: BadgePlacement.topLeft,
  content: '10',
  child: Icon(Icons.mail),
);
NextBadge(
  placement: BadgePlacement.bottomRight,
  content: 'New',
  child: Icon(Icons.message),
);
NextBadge(
  placement: BadgePlacement.bottomLeft,
  content: '3',
  child: Icon(Icons.shopping_cart),
);

// Shapes
NextBadge(
  shape: BadgeShape.circle,
  content: '5',
  child: Icon(Icons.notifications),
);
NextBadge(
  shape: BadgeShape.rectangle,
  content: 'New',
  child: Icon(Icons.mail),
);

// Dot Badge
NextBadge(
  isDot: true,
  color: BadgeColor.success,
  child: Icon(Icons.notifications),
);

// Invisible Badge
NextBadge(
  isInvisible: true,
  content: '5',
  child: Icon(Icons.notifications),
);

// Without Outline
NextBadge(
  showOutline: false,
  content: '5',
  child: Icon(Icons.notifications),
);

// With Numeric Content
NextBadge(
  content: 99,
  child: Icon(Icons.mail),
);

// With Widget Content
NextBadge(
  content: Icon(Icons.star, size: 12, color: Colors.white),
  child: Icon(Icons.mail),
);
```

### Button

```dart
// Variants
Button.solid(child: Text('Solid'), onPressed: () {});
Button.bordered(child: Text('Bordered'), onPressed: () {});
Button.light(child: Text('Light'), onPressed: () {});
Button.ghost(child: Text('Ghost'), onPressed: () {});

// Colors
Button.solid(
  color: ButtonColor.primary,
  child: Text('Primary'),
  onPressed: () {},
);

// Sizes
Button.solid(
  size: ButtonSize.lg,
  child: Text('Large'),
  onPressed: () {},
);

// Loading State
Button.solid(
  isLoading: true,
  child: Text('Loading...'),
  onPressed: () {},
);

// With Icons
Button.solid(
  startContent: Icon(Icons.download),
  child: Text('Download'),
  onPressed: () {},
);
```

### Card

```dart
// Basic Card
NextCard(
  header: Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  body: Text('This is the card body content.'),
  footer: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(onPressed: () {}, child: Text('Cancel')),
      SizedBox(width: 8),
      ElevatedButton(onPressed: () {}, child: Text('Save')),
    ],
  ),
);

// Pressable Card
NextCard(
  isPressable: true,
  onPressed: () => print('Card pressed'),
  body: Column(
    children: [
      Icon(Icons.favorite, size: 48, color: Colors.red),
      SizedBox(height: 8),
      Text('Tap this card'),
    ],
  ),
);

// Different Shadows and Radius
NextCard(
  shadow: CardShadow.lg,
  radius: CardRadius.md,
  body: Text('Large shadow, medium radius'),
);

// Blurred Footer
NextCard(
  header: Text('Settings'),
  body: Text('Configure your preferences here.'),
  footer: Text('Footer with blur effect'),
  isFooterBlurred: true,
);

// Using CardHeader, CardBody, CardFooter directly
NextCard(
  children: [
    CardHeader(
      padding: EdgeInsets.all(20),
      child: Text('Custom Header'),
    ),
    CardBody(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text('Custom body content with custom padding.'),
    ),
    CardFooter(
      child: Icon(Icons.star, color: Colors.amber),
    ),
  ],
);
```

### Modal

```dart
// Basic Modal
bool isModalOpen = false;

NextButton(
  onPressed: () => setState(() => isModalOpen = true),
  child: Text('Open Modal'),
);

NextModal(
  isOpen: isModalOpen,
  onClose: () => setState(() => isModalOpen = false),
  child: NextModalContent(
    header: NextModalHeader(
      child: Text('Modal Title'),
    ),
    body: NextModalBody(
      child: Text('Modal content goes here.'),
    ),
    footer: NextModalFooter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          NextButton(
            variant: ButtonVariant.light,
            onPressed: () => setState(() => isModalOpen = false),
            child: Text('Close'),
          ),
          SizedBox(width: 8),
          NextButton(
            color: ButtonColor.primary,
            onPressed: () => setState(() => isModalOpen = false),
            child: Text('Action'),
          ),
        ],
      ),
    ),
  ),
);

// Modal Sizes
NextModal(
  size: ModalSize.lg,        // xs, sm, md, lg, xl, xxl, xxxl, xxxxl, xxxxxl, full
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Modal Placements
NextModal(
  placement: ModalPlacement.top,     // auto, top, topCenter, center, bottom, bottomCenter
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Non-dismissible Modal
NextModal(
  isDismissable: false,
  isKeyboardDismissDisabled: true,
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Backdrop Types
NextModal(
  backdrop: ModalBackdrop.blur,      // transparent, opaque, blur
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Scroll Behavior
NextModal(
  scrollBehavior: ModalScrollBehavior.inside,  // normal, inside, outside
  isOpen: true,
  onClose: () {},
  child: NextModalContent(
    body: NextModalBody(
      child: Column(
        children: List.generate(20, (i) => Text('Item $i')),
      ),
    ),
  ),
);

// Draggable Modal
NextModal(
  isDraggable: true,
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Draggable with Overflow
NextModal(
  isDraggable: true,
  allowDragOverflow: true,
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Custom Close Button
NextModal(
  closeButton: IconButton(
    icon: Icon(Icons.cancel),
    onPressed: () {},
  ),
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Hide Close Button
NextModal(
  hideCloseButton: true,
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Custom Radius and Shadow
NextModal(
  radius: ModalRadius.lg,
  shadow: ModalShadow.lg,
  isOpen: true,
  onClose: () {},
  child: NextModalContent(...),
);

// Modal with Form
NextModal(
  isOpen: true,
  onClose: () {},
  child: NextModalContent(
    header: NextModalHeader(child: Text('Sign In')),
    body: NextModalBody(
      child: Column(
        children: [
          NextInput(
            label: 'Email',
            placeholder: 'Enter your email',
          ),
          SizedBox(height: 16),
          NextInput(
            label: 'Password',
            obscureText: true,
            placeholder: 'Enter your password',
          ),
        ],
      ),
    ),
    footer: NextModalFooter(
      child: NextButton(
        color: ButtonColor.primary,
        child: Text('Submit'),
        onPressed: () {},
      ),
    ),
  ),
);
```

### Dropdown

```dart
// Basic Dropdown
NextDropdown(
  trigger: NextDropdownTrigger(
    child: Button.bordered(
      child: Text('Actions'),
    ),
  ),
  menu: NextDropdownMenu(
    onAction: (key) => print('Selected: $key'),
    children: [
      NextDropdownItem(
        itemKey: 'new',
        title: 'New file',
        startContent: Icon(Icons.add),
      ),
      NextDropdownItem(
        itemKey: 'copy',
        title: 'Copy link',
        startContent: Icon(Icons.content_copy),
      ),
      NextDropdownItem(
        itemKey: 'edit',
        title: 'Edit file',
        startContent: Icon(Icons.edit),
      ),
    ],
  ),
);

// With Description
NextDropdown(
  trigger: NextDropdownTrigger(
    child: Button.solid(child: Text('Options')),
  ),
  menu: NextDropdownMenu(
    children: [
      NextDropdownItem(
        itemKey: 'save',
        title: 'Save',
        description: 'Save the current document',
        startContent: Icon(Icons.save),
      ),
      NextDropdownItem(
        itemKey: 'export',
        title: 'Export',
        description: 'Export to PDF or other formats',
        startContent: Icon(Icons.upload),
      ),
    ],
  ),
);

// With Keyboard Shortcuts
NextDropdown(
  trigger: NextDropdownTrigger(
    child: Button.flat(child: Text('Edit')),
  ),
  menu: NextDropdownMenu(
    children: [
      NextDropdownItem(
        itemKey: 'undo',
        title: 'Undo',
        shortcut: '⌘Z',
        startContent: Icon(Icons.undo),
      ),
      NextDropdownItem(
        itemKey: 'redo',
        title: 'Redo',
        shortcut: '⌘⇧Z',
        startContent: Icon(Icons.redo),
      ),
    ],
  ),
);

// Single Selection
String? selectedOption;

NextDropdown(
  closeOnSelect: false,
  trigger: NextDropdownTrigger(
    child: Button.bordered(
      child: Text(selectedOption ?? 'Select one'),
    ),
  ),
  menu: NextDropdownMenu(
    selectionMode: DropdownSelectionMode.single,
    onAction: (key) {
      setState(() => selectedOption = key);
    },
    children: [
      NextDropdownItem(itemKey: 'option1', title: 'Option 1'),
      NextDropdownItem(itemKey: 'option2', title: 'Option 2'),
      NextDropdownItem(itemKey: 'option3', title: 'Option 3'),
    ],
  ),
);

// Multiple Selection
Set<String> selectedItems = {};

NextDropdown(
  closeOnSelect: false,
  trigger: NextDropdownTrigger(
    child: Button.bordered(
      child: Text('Selected: ${selectedItems.length}'),
    ),
  ),
  menu: NextDropdownMenu(
    selectionMode: DropdownSelectionMode.multiple,
    selectedKeys: selectedItems,
    onSelectionChange: (keys) {
      setState(() => selectedItems = keys);
    },
    children: [
      NextDropdownItem(itemKey: 'item1', title: 'Item 1'),
      NextDropdownItem(itemKey: 'item2', title: 'Item 2'),
      NextDropdownItem(itemKey: 'item3', title: 'Item 3'),
    ],
  ),
);

// With Sections
NextDropdown(
  trigger: NextDropdownTrigger(
    child: Button.ghost(child: Text('Menu')),
  ),
  menu: NextDropdownMenu(
    children: [
      NextDropdownSection(
        title: 'File',
        children: [
          NextDropdownItem(
            itemKey: 'new',
            title: 'New',
            startContent: Icon(Icons.add),
          ),
          NextDropdownItem(
            itemKey: 'open',
            title: 'Open',
            startContent: Icon(Icons.folder_open),
          ),
        ],
      ),
      NextDropdownSection(
        title: 'Edit',
        showDivider: true,
        children: [
          NextDropdownItem(
            itemKey: 'cut',
            title: 'Cut',
            startContent: Icon(Icons.content_cut),
          ),
          NextDropdownItem(
            itemKey: 'copy',
            title: 'Copy',
            startContent: Icon(Icons.content_copy),
          ),
        ],
      ),
    ],
  ),
);

// Disabled Items
NextDropdown(
  trigger: NextDropdownTrigger(
    child: Button.solid(child: Text('Actions')),
  ),
  menu: NextDropdownMenu(
    disabledKeys: {'delete'},
    children: [
      NextDropdownItem(itemKey: 'edit', title: 'Edit'),
      NextDropdownItem(itemKey: 'duplicate', title: 'Duplicate'),
      NextDropdownItem(itemKey: 'delete', title: 'Delete (disabled)'),
    ],
  ),
);

// Dropdown Variants
NextDropdown(
  menu: NextDropdownMenu(
    variant: DropdownVariant.bordered,  // solid, bordered, light, flat, faded, shadow
    children: [...],
  ),
);

// Dropdown Colors
NextDropdown(
  menu: NextDropdownMenu(
    color: DropdownColor.primary,  // defaultColor, primary, secondary, success, warning, danger
    children: [...],
  ),
);
```

### Toast

> **Important**: Wrap your app with `NextToastProvider` before using toasts.

```dart
// Wrap your app with NextToastProvider
void main() {
  runApp(
    MaterialApp(
      home: NextToastProvider(
        child: MyApp(),
      ),
    ),
  );
}

// Basic Toast
showToast(
  context,
  title: 'Notification',
  description: 'This is a toast notification.',
);

// Success Toast
showSuccessToast(
  context,
  title: 'Success!',
  description: 'Your action was completed successfully.',
);

// Error Toast
showErrorToast(
  context,
  title: 'Error!',
  description: 'Something went wrong.',
);

// Warning Toast
showWarningToast(
  context,
  title: 'Warning!',
  description: 'Please review your input.',
);

// Info Toast
showInfoToast(
  context,
  title: 'Info',
  description: 'Here is some information.',
);

// Toast with Custom Settings
showToast(
  context,
  title: 'Custom Toast',
  description: 'Fully customizable toast.',
  icon: Icon(Icons.star),
  color: ToastColor.primary,
  variant: ToastVariant.solid,
  radius: ToastRadius.lg,
  timeout: 5000,
);

// Toast with Progress Bar
showToast(
  context,
  title: 'Auto-dismiss in 5s',
  description: 'Watch the progress bar.',
  timeout: 5000,
  shouldShowTimeoutProgress: true,
  icon: Icon(Icons.timelapse),
  color: ToastColor.primary,
);

// Toast Variants
showToast(
  context,
  title: 'Solid',
  variant: ToastVariant.solid,    // solid, bordered, flat
  color: ToastColor.primary,
);

showToast(
  context,
  title: 'Bordered',
  variant: ToastVariant.bordered,
  color: ToastColor.success,
);

showToast(
  context,
  title: 'Flat',
  variant: ToastVariant.flat,
  color: ToastColor.warning,
);

// Toast without Icon
showToast(
  context,
  title: 'No Icon',
  description: 'This toast has no icon.',
  hideIcon: true,
);

// Toast without Close Button
showToast(
  context,
  title: 'No Close Button',
  description: 'This toast will auto-dismiss.',
  hideCloseButton: true,
  timeout: 3000,
);

// Custom Close Icon
showToast(
  context,
  title: 'Custom Close',
  closeIcon: Icon(Icons.cancel, size: 18),
  color: ToastColor.danger,
);

// Toast Provider with Custom Placement
NextToastProvider(
  placement: ToastPlacement.topRight,  // topRight, topLeft, topCenter, bottomRight, bottomLeft, bottomCenter
  maxVisibleToasts: 3,
  toastOffset: 16,
  child: MyApp(),
);

// Manually Remove Toast
final toastId = showToast(context, title: 'Persistent Toast', timeout: 0);
// Later, remove it:
NextToastProvider.of(context).removeToast(toastId);

// Clear All Toasts
NextToastProvider.of(context).clearAllToasts();
```

### Table

```dart
// Define your data model
class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String status;
  
  User({required this.id, required this.name, required this.email, required this.role, required this.status});
}

// Define columns
final columns = [
  TableColumnDef<User>(
    key: 'name',
    label: 'Name',
    allowsSorting: true,
    builder: (user) => Text(user.name),
  ),
  TableColumnDef<User>(
    key: 'email',
    label: 'Email',
    builder: (user) => Text(user.email),
  ),
  TableColumnDef<User>(
    key: 'role',
    label: 'Role',
    builder: (user) => Text(user.role),
  ),
  TableColumnDef<User>(
    key: 'status',
    label: 'Status',
    builder: (user) => NextChip.flat(
      color: user.status == 'Active' ? ChipColor.success : ChipColor.warning,
      size: ChipSize.sm,
      child: Text(user.status),
    ),
  ),
];

// Your data
final users = [
  User(id: '1', name: 'Tony Reichert', email: 'tony@example.com', role: 'CEO', status: 'Active'),
  User(id: '2', name: 'Zoey Lang', email: 'zoey@example.com', role: 'Tech Lead', status: 'Paused'),
  User(id: '3', name: 'Jane Fisher', email: 'jane@example.com', role: 'Sr. Dev', status: 'Active'),
];

// Basic Table
NextTable<User>(
  columns: columns,
  rows: users,
);

// Striped Table
NextTable<User>(
  columns: columns,
  rows: users,
  isStriped: true,
);

// Compact Table
NextTable<User>(
  columns: columns,
  rows: users,
  isCompact: true,
);

// Table with Single Selection
Set<String> selectedKeys = {};

NextTable<User>(
  columns: columns,
  rows: users,
  selectionMode: TableSelectionMode.single,
  selectedKeys: selectedKeys,
  onSelectionChange: (keys) {
    setState(() => selectedKeys = keys);
  },
);

// Table with Multiple Selection
NextTable<User>(
  columns: columns,
  rows: users,
  selectionMode: TableSelectionMode.multiple,
  onSelectionChange: (keys) {
    print('Selected: $keys');
  },
);

// Sortable Table
TableSortDescriptor? sortDescriptor;

NextTable<User>(
  columns: columns,
  rows: users,
  sortDescriptor: sortDescriptor,
  onSortChange: (descriptor) {
    setState(() => sortDescriptor = descriptor);
    // Sort your data here
  },
);

// Table with Empty State
NextTable<User>(
  columns: columns,
  rows: [],
  emptyContent: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.inbox, size: 48, color: Colors.grey),
      SizedBox(height: 16),
      Text('No users found', style: TextStyle(color: Colors.grey)),
    ],
  ),
);

// Table without Header
NextTable<User>(
  columns: columns,
  rows: users,
  hideHeader: true,
);

// Table without Wrapper
NextTable<User>(
  columns: columns,
  rows: users,
  removeWrapper: true,
);

// Table with Top/Bottom Content
NextTable<User>(
  columns: columns,
  rows: users,
  topContent: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Users List', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  ),
  bottomContent: Padding(
    padding: EdgeInsets.all(16),
    child: Text('Total: ${users.length} users'),
  ),
);

// Table with Row Action
NextTable<User>(
  columns: columns,
  rows: users,
  onRowAction: (user) {
    print('Row tapped: ${user.name}');
  },
);

// Table with Disabled Rows
NextTable<User>(
  columns: columns,
  rows: users,
  selectionMode: TableSelectionMode.single,
  disabledKeys: {'2'},  // Disable second row
);

// Column Alignment
final alignedColumns = [
  TableColumnDef<User>(
    key: 'name',
    label: 'Name',
    align: TableColumnAlign.start,
    builder: (user) => Text(user.name),
  ),
  TableColumnDef<User>(
    key: 'email',
    label: 'Email',
    align: TableColumnAlign.center,
    builder: (user) => Text(user.email),
  ),
  TableColumnDef<User>(
    key: 'actions',
    label: 'Actions',
    align: TableColumnAlign.end,
    builder: (user) => IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ),
];

// Custom Column Widths
final customWidthColumns = [
  TableColumnDef<User>(
    key: 'name',
    label: 'Name',
    width: 200,
    builder: (user) => Text(user.name),
  ),
  TableColumnDef<User>(
    key: 'email',
    label: 'Email',
    minWidth: 150,
    builder: (user) => Text(user.email),
  ),
];
```

### Chip

```dart
// Basic Chip
NextChip.solid(child: Text('Solid Chip'));

// With Avatar
NextChip.solid(
  avatar: CircleAvatar(child: Text('A')),
  child: Text('Avatar Chip'),
);

// Closable
NextChip.solid(
  child: Text('Closable'),
  onClose: (event) => print('Chip closed'),
);

// Dot Variant
NextChip.dot(
  color: ChipColor.success,
  child: Text('Status'),
);
```

### Tooltip

```dart
// Basic Tooltip
NextTooltip(
  content: 'This is a tooltip',
  child: Button.solid(
    child: Text('Hover me'),
    onPressed: () {},
  ),
);

// Tooltip Colors
NextTooltip(
  content: 'Primary tooltip',
  color: TooltipColor.primary,
  child: Icon(Icons.info),
);

NextTooltip(
  content: 'Success tooltip',
  color: TooltipColor.success,
  child: Icon(Icons.check_circle),
);

NextTooltip(
  content: 'Danger tooltip',
  color: TooltipColor.danger,
  child: Icon(Icons.error),
);

// Tooltip Sizes
NextTooltip(
  content: 'Small tooltip',
  size: TooltipSize.sm,
  child: Text('Small'),
);

NextTooltip(
  content: 'Medium tooltip',
  size: TooltipSize.md,
  child: Text('Medium'),
);

NextTooltip(
  content: 'Large tooltip',
  size: TooltipSize.lg,
  child: Text('Large'),
);

// With Arrow
NextTooltip(
  content: 'Tooltip with arrow',
  showArrow: true,
  color: TooltipColor.primary,
  child: Icon(Icons.info),
);

// Tooltip Placements
NextTooltip(
  content: 'Top tooltip',
  placement: TooltipPlacement.top,  // top, topStart, topEnd
  child: Icon(Icons.arrow_upward),
);

NextTooltip(
  content: 'Bottom tooltip',
  placement: TooltipPlacement.bottom,  // bottom, bottomStart, bottomEnd
  child: Icon(Icons.arrow_downward),
);

NextTooltip(
  content: 'Left tooltip',
  placement: TooltipPlacement.left,  // left, leftStart, leftEnd
  child: Icon(Icons.arrow_back),
);

NextTooltip(
  content: 'Right tooltip',
  placement: TooltipPlacement.right,  // right, rightStart, rightEnd
  child: Icon(Icons.arrow_forward),
);

// With Custom Offset
NextTooltip(
  content: 'Large offset',
  offset: 15,
  showArrow: true,
  child: Icon(Icons.info),
);

// With Delay
NextTooltip(
  content: 'Appears after 1 second',
  delay: 1000,
  closeDelay: 500,
  child: Text('Hover me'),
);

// Controlled Tooltip
bool isTooltipOpen = false;

NextTooltip(
  content: 'Controlled tooltip',
  isOpen: isTooltipOpen,
  onOpenChange: (value) {
    setState(() => isTooltipOpen = value);
  },
  child: Icon(Icons.help),
);

// Disabled Tooltip
NextTooltip(
  content: 'This won\'t show',
  isDisabled: true,
  child: Text('Disabled'),
);

// Tooltip Radius
NextTooltip(
  content: 'Rounded tooltip',
  radius: TooltipRadius.lg,
  color: TooltipColor.primary,
  child: Icon(Icons.info),
);

// Tooltip Shadow
NextTooltip(
  content: 'Shadow tooltip',
  shadow: TooltipShadow.lg,
  color: TooltipColor.success,
  child: Icon(Icons.check),
);

// On Icons
NextTooltip(
  content: 'Information',
  color: TooltipColor.primary,
  showArrow: true,
  child: Icon(Icons.info),
);

NextTooltip(
  content: 'Delete',
  color: TooltipColor.danger,
  showArrow: true,
  placement: TooltipPlacement.bottom,
  child: Icon(Icons.delete),
);
```

### Switch

```dart
// Basic Switch
NextSwitch(
  isSelected: true,
  onValueChange: (value) => print('Switch: $value'),
);

// Switch with Label
NextSwitch(
  isSelected: false,
  label: Text('Enable notifications'),
  onValueChange: (value) {},
);

// Switch Sizes
NextSwitch.small(isSelected: true);   // Small
NextSwitch.medium(isSelected: true);  // Medium (default)
NextSwitch.large(isSelected: true);   // Large

// Switch Colors
NextSwitch(
  color: SwitchColor.primary,
  isSelected: true,
  onValueChange: (value) {},
);

// Switch with Icons
NextSwitch(
  isSelected: true,
  label: Text('Dark Mode'),
  startContent: Icon(Icons.dark_mode),
  thumbIcon: Icon(Icons.check, size: 16, color: Colors.white),
  onValueChange: (value) {},
);

// Disabled Switch
NextSwitch(
  isSelected: true,
  isDisabled: true,
  label: Text('Disabled'),
);

// Read-only Switch
NextSwitch(
  isSelected: true,
  isReadOnly: true,
  label: Text('Read-only'),
);

// Controlled Switch
bool isEnabled = false;

NextSwitch(
  isSelected: isEnabled,
  label: Text('Toggle Feature'),
  onValueChange: (value) {
    setState(() {
      isEnabled = value;
    });
  },
### Input

```dart
// Basic Input
NextInput(
  label: 'Username',
  placeholder: 'Enter your username',
);

// Input Variants
NextInput(variant: InputVariant.flat);      // Default
NextInput(variant: InputVariant.bordered);  // With border
NextInput(variant: InputVariant.faded);     // Faded background
NextInput(variant: InputVariant.underlined);// Underlined

// Colors and Sizes
NextInput(
  color: InputColor.primary,
  size: InputSize.lg,
  label: 'Large Primary Input',
);

// Password Input
NextInput(
  label: 'Password',
  obscureText: true,
  startContent: Icon(Icons.lock),
);

// Input with Validation
NextInput(
  label: 'Email',
  isRequired: true,
  isInvalid: emailError,
  errorMessage: 'Please enter a valid email',
  keyboardType: TextInputType.emailAddress,
);

// Clearable Input
NextInput(
  label: 'Search',
  isClearable: true,
  startContent: Icon(Icons.search),
);

// Textarea
NextInput(
  label: 'Message',
  maxLines: 4,
  description: 'Tell us what you think',
);

// Label Placements
NextInput(
  labelPlacement: LabelPlacement.outside,
  label: 'Outside Label',
);
```

### Input OTP

````dart
// Basic 6-digit OTP
NextInputOTP(
  length: 6,
  onCompleted: (value) => print('OTP: $value'),
);

// Custom 4-digit OTP
NextInputOTP(
  length: 4,
  size: InputSize.lg,
  color: InputColor.success,
  spacing: 12,
);

// OTP with Separator
NextInputOTP(
  length: 6,
  separator: Text('-', style: TextStyle(fontSize: 24)),
);

// Secure OTP
NextInputOTP(
  length: 4,
  obscureText: true,
  keyboardType: TextInputType.number,
### Switch

```dart
// Basic Switch
NextSwitch(
  isSelected: true,
  onValueChange: (value) => print('Switch: $value'),
);

// Switch with Label
NextSwitch(
  isSelected: false,
  label: Text('Enable notifications'),
  onValueChange: (value) {},
);

// Switch Sizes
NextSwitch.small(isSelected: true);   // Small
NextSwitch.medium(isSelected: true);  // Medium (default)
NextSwitch.large(isSelected: true);   // Large

// Switch Colors
NextSwitch(
  color: SwitchColor.primary,
  isSelected: true,
  onValueChange: (value) {},
);

// Switch with Icons
NextSwitch(
  isSelected: true,
  label: Text('Dark Mode'),
  startContent: Icon(Icons.dark_mode),
  thumbIcon: Icon(Icons.check, size: 16, color: Colors.white),
  onValueChange: (value) {},
);

// Disabled Switch
NextSwitch(
  isSelected: true,
  isDisabled: true,
  label: Text('Disabled'),
);

// Read-only Switch
NextSwitch(
  isSelected: true,
  isReadOnly: true,
  label: Text('Read-only'),
);

// Controlled Switch
bool isEnabled = false;

NextSwitch(
  isSelected: isEnabled,
  label: Text('Toggle Feature'),
  onValueChange: (value) {
    setState(() {
      isEnabled = value;
    });
  },
### Input

```dart
// Basic Input
NextInput(
  label: 'Username',
  placeholder: 'Enter your username',
);

// Input Variants
NextInput(variant: InputVariant.flat);      // Default
NextInput(variant: InputVariant.bordered);  // With border
NextInput(variant: InputVariant.faded);     // Faded background
NextInput(variant: InputVariant.underlined);// Underlined

// Colors and Sizes
NextInput(
  color: InputColor.primary,
  size: InputSize.lg,
  label: 'Large Primary Input',
);

// Password Input
NextInput(
  label: 'Password',
  obscureText: true,
  startContent: Icon(Icons.lock),
);

// Input with Validation
NextInput(
  label: 'Email',
  isRequired: true,
  isInvalid: emailError,
  errorMessage: 'Please enter a valid email',
  keyboardType: TextInputType.emailAddress,
);

// Clearable Input
NextInput(
  label: 'Search',
  isClearable: true,
  startContent: Icon(Icons.search),
);

// Textarea
NextInput(
  label: 'Message',
  maxLines: 4,
  description: 'Tell us what you think',
);

// Label Placements
NextInput(
  labelPlacement: LabelPlacement.outside,
  label: 'Outside Label',
);
````

### Input OTP

```dart
// Basic 6-digit OTP
NextInputOTP(
  length: 6,
  onCompleted: (value) => print('OTP: $value'),
);

// Custom 4-digit OTP
NextInputOTP(
  length: 4,
  size: InputSize.lg,
  color: InputColor.success,
  spacing: 12,
);

// OTP with Separator
NextInputOTP(
  length: 6,
  separator: Text('-', style: TextStyle(fontSize: 24)),
);

// Secure OTP
NextInputOTP(
  length: 4,
  obscureText: true,
  keyboardType: TextInputType.number,
);
```

### Checkbox

```dart
// Basic Checkbox
NextCheckbox(
  children: Text('Accept terms'),
  onValueChange: (value) => print('Value: $value'),
);

// Indeterminate
NextCheckbox(
  children: Text('Select All'),
  isIndeterminate: true,
);

// Checkbox Group
NextCheckboxGroup(
  label: 'Select your interests',
  children: [
    NextGroupCheckbox(value: 'sports', children: Text('Sports')),
    NextGroupCheckbox(value: 'music', children: Text('Music')),
    NextGroupCheckbox(value: 'travel', children: Text('Travel')),
  ],
);
```

### Radio Group

```dart
RadioGroup(
  label: Text('Choose framework'),
  children: [
    NextRadio(value: 'flutter', child: Text('Flutter')),
    NextRadio(value: 'react', child: Text('React Native')),
    NextRadio(value: 'native', child: Text('Native')),
  ],
);

// Horizontal Layout
RadioGroup(
  orientation: RadioGroupOrientation.horizontal,
  children: [
    NextRadio(value: 'yes', child: Text('Yes')),
    NextRadio(value: 'no', child: Text('No')),
  ],
);
```

### Circular Progress

```dart
// Indeterminate
NextCircularProgress(
  label: Text('Loading...'),
);

// Determinate
NextCircularProgress(
  value: 0.75,
  isIndeterminate: false,
  label: Text('Progress'),
  showValueLabel: true,
);

// Custom Colors and Sizes
NextCircularProgress(
  value: 0.8,
  color: CircularProgressColor.success,
  size: CircularProgressSize.lg,
  strokeWidth: 4,
  label: Text('Upload Complete'),
);
```

## Example App 📱

The package includes a comprehensive example app showcasing all components:

```sh
cd example
flutter run
```

The example app features:

- **7 Interactive Tabs**: Buttons,Cards, Chips, Switches, Inputs, Checkboxes, Radio
  Groups, Progress, Typography
- **Live Demonstrations**: All variants, sizes, colors, and states
- **Interactive Controls**: Real-time component customization
- **Best Practices**: Proper usage patterns and code examples

## Theme Customization 🎨

Next UI components integrate with Flutter's Material Theme:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  ),
  home: MyHomePage(),
);
```

### Custom Colors

```dart
// Components support multiple color variants
Button.solid(color: ButtonColor.primary);    // Blue
Button.solid(color: ButtonColor.success);    // Green  
Button.solid(color: ButtonColor.warning);    // Orange
Button.solid(color: ButtonColor.danger);     // Red
Button.solid(color: ButtonColor.secondary);  // Purple
```

## API Reference 📖

### Button

| Property       | Type            | Description    |
| -------------- | --------------- | -------------- |
| `child`        | `Widget?`       | Button content |
| `onPressed`    | `VoidCallback?` | Tap callback   |
| `variant`      | `ButtonVariant` | Visual style   |
| `color`        | `ButtonColor`   | Color theme    |
| `size`         | `ButtonSize`    | Button size    |
| `isLoading`    | `bool`          | Loading state  |
| `isDisabled`   | `bool`          | Disabled state |
| `startContent` | `Widget?`       | Leading icon   |
| `endContent`   | `Widget?`       | Trailing icon  |

### NextCard

| Property                    | Type                  | Description                   |
| --------------------------- | --------------------- | ----------------------------- |
| `header`                    | `Widget?`             | Header content widget         |
| `body`                      | `Widget?`             | Body content widget           |
| `footer`                    | `Widget?`             | Footer content widget         |
| `children`                  | `List<Widget>?`       | Alternative content children  |
| `shadow`                    | `CardShadow`          | Shadow depth                  |
| `radius`                    | `CardRadius`          | Border radius                 |
| `fullWidth`                 | `bool`                | Take full width               |
| `isHoverable`               | `bool`                | Enable hover effects          |
| `isPressable`               | `bool`                | Make card pressable           |
| `isBlurred`                 | `bool`                | Apply blur effect             |
| `isFooterBlurred`           | `bool`                | Blur footer only              |
| `isDisabled`                | `bool`                | Disable interactions          |
| `disableAnimation`          | `bool`                | Disable animations            |
| `disableRipple`             | `bool`                | Disable ripple effects        |
| `allowTextSelectionOnPress` | `bool`                | Allow text selection on press |
| `onPressed`                 | `VoidCallback?`       | Press callback                |
| `onPressStart`              | `VoidCallback?`       | Press start callback          |
| `onPressEnd`                | `VoidCallback?`       | Press end callback            |
| `onPressChange`             | `ValueChanged<bool>?` | Press state change callback   |
| `onPressUp`                 | `VoidCallback?`       | Press up callback             |
| `padding`                   | `EdgeInsetsGeometry?` | Internal padding              |
| `margin`                    | `EdgeInsetsGeometry?` | External margin               |
| `height`                    | `double?`             | Fixed height                  |
| `width`                     | `double?`             | Fixed width                   |
| `decoration`                | `BoxDecoration?`      | Custom decoration             |
| `constraints`               | `BoxConstraints?`     | Size constraints              |

### NextChip

| Property       | Type          | Description      |
| -------------- | ------------- | ---------------- |
| `child`        | `Widget?`     | Chip content     |
| `variant`      | `ChipVariant` | Visual style     |
| `color`        | `ChipColor`   | Color theme      |
| `size`         | `ChipSize`    | Chip size        |
| `avatar`       | `Widget?`     | Avatar widget    |
| `onClose`      | `Function?`   | Close callback   |
| `startContent` | `Widget?`     | Leading content  |
| `endContent`   | `Widget?`     | Trailing content |

### NextSwitch

| Property           | Type                  | Description                |
| ------------------ | --------------------- | -------------------------- |
| `value`            | `String?`             | Form field value           |
| `isSelected`       | `bool?`               | Whether switch is selected |
| `defaultSelected`  | `bool`                | Default selected state     |
| `onChanged`        | `ValueChanged<bool>?` | Native change callback     |
| `onValueChange`    | `ValueChanged<bool>?` | Value change callback      |
| `size`             | `SwitchSize`          | Switch size (sm, md, lg)   |
| `color`            | `SwitchColor`         | Color theme                |
| `label`            | `Widget?`             | Label widget               |
| `startContent`     | `Widget?`             | Leading content widget     |
| `endContent`       | `Widget?`             | Trailing content widget    |
| `thumbIcon`        | `Widget?`             | Icon inside thumb          |
| `isDisabled`       | `bool`                | Disabled state             |
| `isReadOnly`       | `bool`                | Read-only state            |
| `disableAnimation` | `bool`                | Disable animations         |
| `name`             | `String?`             | Form field name            |
| `autofocus`        | `bool`                | Auto-focus on mount        |
| `focusNode`        | `FocusNode?`          | Focus node                 |
| `margin`           | `EdgeInsetsGeometry?` | External margin            |
| `padding`          | `EdgeInsetsGeometry?` | Internal padding           |
### NextInput

| Property         | Type                     | Description              |
| ---------------- | ------------------------ | ------------------------ |
| `controller`     | `TextEditingController?` | Text editing controller  |
| `value`          | `String?`                | Initial text value       |
| `onChanged`      | `ValueChanged<String>?`  | Text change callback     |
| `onSubmitted`    | `ValueChanged<String>?`  | Submit callback          |
| `onClear`        | `VoidCallback?`          | Clear button callback    |
| `variant`        | `InputVariant`           | Visual style variant     |
| `color`          | `InputColor`             | Color theme              |
| `size`           | `InputSize`              | Input field size         |
| `radius`         | `InputRadius`            | Border radius            |
| `labelPlacement` | `LabelPlacement`         | Label position           |
| `label`          | `String?`                | Label text               |
| `placeholder`    | `String?`                | Placeholder text         |
| `description`    | `String?`                | Helper description       |
| `errorMessage`   | `String?`                | Error message            |
| `startContent`   | `Widget?`                | Leading widget           |
| `endContent`     | `Widget?`                | Trailing widget          |
| `isRequired`     | `bool`                   | Required field indicator |
| `isDisabled`     | `bool`                   | Disabled state           |
| `isReadOnly`     | `bool`                   | Read-only state          |
| `isInvalid`      | `bool`                   | Invalid state            |
| `isClearable`    | `bool`                   | Show clear button        |
| `obscureText`    | `bool`                   | Password mode            |
| `maxLines`       | `int?`                   | Maximum lines            |
| `keyboardType`   | `TextInputType?`         | Keyboard type            |

### NextInputOTP

| Property       | Type                    | Description             |
| -------------- | ----------------------- | ----------------------- |
| `length`       | `int`                   | Number of OTP digits    |
| `onChanged`    | `ValueChanged<String>?` | Value change callback   |
| `onCompleted`  | `ValueChanged<String>?` | Completion callback     |
| `separator`    | `Widget?`               | Custom separator widget |
| `size`         | `InputSize`             | Input field size        |
| `color`        | `InputColor`            | Color theme             |
| `spacing`      | `double`                | Spacing between fields  |
| `isDisabled`   | `bool`                  | Disabled state          |
| `isInvalid`    | `bool`                  | Invalid state           |
| `obscureText`  | `bool`                  | Hide input text         |
| `keyboardType` | `TextInputType`         | Keyboard type           |

### NextSwitch

| Property           | Type                  | Description                |
| ------------------ | --------------------- | -------------------------- |
| `value`            | `String?`             | Form field value           |
| `isSelected`       | `bool?`               | Whether switch is selected |
| `defaultSelected`  | `bool`                | Default selected state     |
| `onChanged`        | `ValueChanged<bool>?` | Native change callback     |
| `onValueChange`    | `ValueChanged<bool>?` | Value change callback      |
| `size`             | `SwitchSize`          | Switch size (sm, md, lg)   |
| `color`            | `SwitchColor`         | Color theme                |
| `label`            | `Widget?`             | Label widget               |
| `startContent`     | `Widget?`             | Leading content widget     |
| `endContent`       | `Widget?`             | Trailing content widget    |
| `thumbIcon`        | `Widget?`             | Icon inside thumb          |
| `isDisabled`       | `bool`                | Disabled state             |
| `isReadOnly`       | `bool`                | Read-only state            |
| `disableAnimation` | `bool`                | Disable animations         |
| `name`             | `String?`             | Form field name            |
| `autofocus`        | `bool`                | Auto-focus on mount        |
| `focusNode`        | `FocusNode?`          | Focus node                 |
| `margin`           | `EdgeInsetsGeometry?` | External margin            |
| `padding`          | `EdgeInsetsGeometry?` | Internal padding           |

### NextInput

| Property         | Type                     | Description              |
| ---------------- | ------------------------ | ------------------------ |
| `controller`     | `TextEditingController?` | Text editing controller  |
| `value`          | `String?`                | Initial text value       |
| `onChanged`      | `ValueChanged<String>?`  | Text change callback     |
| `onSubmitted`    | `ValueChanged<String>?`  | Submit callback          |
| `onClear`        | `VoidCallback?`          | Clear button callback    |
| `variant`        | `InputVariant`           | Visual style variant     |
| `color`          | `InputColor`             | Color theme              |
| `size`           | `InputSize`              | Input field size         |
| `radius`         | `InputRadius`            | Border radius            |
| `labelPlacement` | `LabelPlacement`         | Label position           |
| `label`          | `String?`                | Label text               |
| `placeholder`    | `String?`                | Placeholder text         |
| `description`    | `String?`                | Helper description       |
| `errorMessage`   | `String?`                | Error message            |
| `startContent`   | `Widget?`                | Leading widget           |
| `endContent`     | `Widget?`                | Trailing widget          |
| `isRequired`     | `bool`                   | Required field indicator |
| `isDisabled`     | `bool`                   | Disabled state           |
| `isReadOnly`     | `bool`                   | Read-only state          |
| `isInvalid`      | `bool`                   | Invalid state            |
| `isClearable`    | `bool`                   | Show clear button        |
| `obscureText`    | `bool`                   | Password mode            |
| `maxLines`       | `int?`                   | Maximum lines            |
| `keyboardType`   | `TextInputType?`         | Keyboard type            |

### NextInputOTP

| Property       | Type                    | Description             |
| -------------- | ----------------------- | ----------------------- |
| `length`       | `int`                   | Number of OTP digits    |
| `onChanged`    | `ValueChanged<String>?` | Value change callback   |
| `onCompleted`  | `ValueChanged<String>?` | Completion callback     |
| `separator`    | `Widget?`               | Custom separator widget |
| `size`         | `InputSize`             | Input field size        |
| `color`        | `InputColor`            | Color theme             |
| `spacing`      | `double`                | Spacing between fields  |
| `isDisabled`   | `bool`                  | Disabled state          |
| `isInvalid`    | `bool`                  | Invalid state           |
| `obscureText`  | `bool`                  | Hide input text         |
| `keyboardType` | `TextInputType`         | Keyboard type           |

### NextCheckbox

| Property          | Type                  | Description         |
| ----------------- | --------------------- | ------------------- |
| `children`        | `Widget?`             | Label content       |
| `isSelected`      | `bool?`               | Selection state     |
| `onValueChange`   | `ValueChanged<bool>?` | Change callback     |
| `color`           | `CheckboxColor`       | Color theme         |
| `size`            | `CheckboxSize`        | Checkbox size       |
| `isIndeterminate` | `bool`                | Indeterminate state |
| `isDisabled`      | `bool`                | Disabled state      |
| `isInvalid`       | `bool`                | Invalid state       |

## Contributing 🤝

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md)
for details.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Testing 🧪

For first time users, install the [very_good_cli][very_good_cli_link]:

```sh
dart pub global activate very_good_cli
```

To run all unit tests:

```sh
very_good test --coverage
```

To view the generated coverage report you can use
[lcov](https://github.com/linux-test-project/lcov):

```sh
# Generate Coverage Report
genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
open coverage/index.html
```

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file
for details.

---

## Links & References 🔗

- [Flutter Documentation][flutter_install_link]
- [HeroUI Design System](https://heroui.com/)
- [Material Design 3](https://m3.material.io/)

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
