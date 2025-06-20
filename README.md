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
              
              // Chip Example
              NextChip.solid(
                child: Text('Success'),
                color: ChipColor.success,
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
| **Button**            | 7 variants, 3 sizes, 6 colors, loading states, icons     | ✅ Complete |
| **Chip**              | 7 variants, 3 sizes, 6 colors, closable, avatar support  | ✅ Complete |
| **Checkbox**          | 3 sizes, 6 colors, indeterminate state, validation       | ✅ Complete |
| **Checkbox Group**    | Multi-selection, validation, orientation control         | ✅ Complete |
| **Radio Group**       | Single selection, validation, horizontal/vertical layout | ✅ Complete |
| **Circular Progress** | Determinate/indeterminate, custom labels, stroke width   | ✅ Complete |
| **Typography**        | H1-H6, paragraph, caption, multiple weights              | ✅ Complete |

### 🚧 Roadmap

| Planned Components | Status     |
| ------------------ | ---------- |
| Button Group       | 🔄 Planned |
| Card               | 🔄 Planned |
| Input/TextField    | 🔄 Planned |
| Switch             | 🔄 Planned |
| Avatar             | 🔄 Planned |
| Badge              | 🔄 Planned |
| Modal              | 🔄 Planned |
| Dropdown           | 🔄 Planned |
| Table              | 🔄 Planned |
| Tooltip            | 🔄 Planned |
| Navbar             | 🔄 Planned |
| Pagination         | 🔄 Planned |
| Dark Mode Support  | 🔄 Planned |

## Component Examples 📚

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

- **6 Interactive Tabs**: Buttons, Chips, Checkboxes, Radio Groups, Progress,
  Typography
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
