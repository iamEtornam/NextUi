import 'package:flutter/material.dart' hide RadioGroup;
import 'package:next_ui/next_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next UI Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NextToastProvider(child: ComponentShowcasePage()),
    );
  }
}

class ComponentShowcasePage extends StatefulWidget {
  const ComponentShowcasePage({super.key});

  @override
  State<ComponentShowcasePage> createState() => _ComponentShowcasePageState();
}

class _ComponentShowcasePageState extends State<ComponentShowcasePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 15, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 12, runSpacing: 12, children: children),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next UI Components'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Avatars'),
            Tab(text: 'Badges'),
            Tab(text: 'Buttons'),
            Tab(text: 'Cards'),
            Tab(text: 'Chips'),
            Tab(text: 'Dropdowns'),
            Tab(text: 'Inputs'),
            Tab(text: 'Modals'),
            Tab(text: 'Switches'),
            Tab(text: 'Checkboxes'),
            Tab(text: 'Radio Groups'),
            Tab(text: 'Progress'),
            Tab(text: 'Tables'),
            Tab(text: 'Toasts'),
            Tab(text: 'Tooltips'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAvatarsTab(),
          _buildBadgesTab(),
          _buildButtonsTab(),
          _buildCardsTab(),
          _buildChipsTab(),
          _buildDropdownsTab(),
          _buildInputsTab(),
          _buildModalsTab(),
          _buildSwitchesTab(),
          _buildCheckboxTab(),
          _buildRadioTab(),
          _buildProgressTab(),
          _buildTablesTab(),
          _buildToastsTab(),
          _buildTooltipsTab(),
        ],
      ),
    );
  }

  Widget _buildAvatarsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Avatar Sizes',
            children: const [
              NextAvatar(
                size: AvatarSize.sm,
                name: 'John Doe',
                showFallback: true,
              ),
              NextAvatar(
                size: AvatarSize.md,
                name: 'Jane Smith',
                showFallback: true,
              ),
              NextAvatar(
                size: AvatarSize.lg,
                name: 'Bob Johnson',
                showFallback: true,
              ),
            ],
          ),
          _buildSection(
            title: 'Avatar Colors',
            children: const [
              NextAvatar(
                color: AvatarColor.defaultColor,
                name: 'Default',
                showFallback: true,
              ),
              NextAvatar(
                color: AvatarColor.primary,
                name: 'Primary',
                showFallback: true,
              ),
              NextAvatar(
                color: AvatarColor.secondary,
                name: 'Secondary',
                showFallback: true,
              ),
              NextAvatar(
                color: AvatarColor.success,
                name: 'Success',
                showFallback: true,
              ),
              NextAvatar(
                color: AvatarColor.warning,
                name: 'Warning',
                showFallback: true,
              ),
              NextAvatar(
                color: AvatarColor.danger,
                name: 'Danger',
                showFallback: true,
              ),
            ],
          ),
          _buildSection(
            title: 'Avatar with Images',
            children: const [
              NextAvatar(
                src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
              ),
              NextAvatar(
                src: 'https://i.pravatar.cc/150?u=a04258114e29026702d',
                size: AvatarSize.md,
              ),
              NextAvatar(
                src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d',
                size: AvatarSize.lg,
              ),
            ],
          ),
          _buildSection(
            title: 'Bordered Avatars',
            children: const [
              NextAvatar(
                isBordered: true,
                src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
              ),
              NextAvatar(
                isBordered: true,
                color: AvatarColor.primary,
                name: 'Primary',
                showFallback: true,
              ),
              NextAvatar(
                isBordered: true,
                color: AvatarColor.success,
                name: 'Success',
                showFallback: true,
              ),
            ],
          ),
          _buildSection(
            title: 'Avatar Radius',
            children: const [
              NextAvatar(
                radius: AvatarRadius.none,
                name: 'Square',
                showFallback: true,
              ),
              NextAvatar(
                radius: AvatarRadius.sm,
                name: 'Small',
                showFallback: true,
              ),
              NextAvatar(
                radius: AvatarRadius.md,
                name: 'Medium',
                showFallback: true,
              ),
              NextAvatar(
                radius: AvatarRadius.lg,
                name: 'Large',
                showFallback: true,
              ),
              NextAvatar(
                radius: AvatarRadius.full,
                name: 'Full',
                showFallback: true,
              ),
            ],
          ),
          _buildSection(
            title: 'Disabled Avatars',
            children: const [
              NextAvatar(
                isDisabled: true,
                src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
              ),
              NextAvatar(
                isDisabled: true,
                name: 'Disabled',
                showFallback: true,
              ),
            ],
          ),
          _buildSection(
            title: 'Custom Fallback',
            children: const [
              NextAvatar(icon: Icon(Icons.person_outline), showFallback: true),
              NextAvatar(
                fallback: Icon(Icons.star, color: Colors.amber),
                showFallback: true,
              ),
              NextAvatar(
                fallback: Icon(Icons.favorite, color: Colors.red),
                showFallback: true,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avatar Group - Stacked',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const NextAvatarGroup(
                  children: [
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a04258114e29026702d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avatar Group - With Max Count',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const NextAvatarGroup(
                  max: 3,
                  children: [
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a04258114e29026702d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avatar Group - Grid Layout',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const NextAvatarGroup(
                  isGrid: true,
                  children: [
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026024d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a04258114e29026702d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a048581f4e29026701d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a092581d4ef9026700d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                    ),
                    NextAvatar(
                      src: 'https://i.pravatar.cc/150?u=a042581f4e29026706d',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Avatar Group - With Initials',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const NextAvatarGroup(
                  color: AvatarColor.primary,
                  isBordered: true,
                  children: [
                    NextAvatar(name: 'John Doe', showFallback: true),
                    NextAvatar(name: 'Jane Smith', showFallback: true),
                    NextAvatar(name: 'Bob Johnson', showFallback: true),
                    NextAvatar(name: 'Alice Williams', showFallback: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Badge Variants',
            children: [
              NextBadge.solid(
                content: '5',
                child: const Icon(Icons.notifications, size: 32),
              ),
              NextBadge.flat(
                content: 'New',
                child: const Icon(Icons.mail, size: 32),
              ),
              NextBadge.faded(
                content: '99+',
                child: const Icon(Icons.message, size: 32),
              ),
              NextBadge.shadow(
                content: '3',
                child: const Icon(Icons.shopping_cart, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'Badge Colors',
            children: [
              const NextBadge(
                color: BadgeColor.defaultColor,
                content: '5',
                child: Icon(Icons.notifications, size: 32),
              ),
              const NextBadge(
                color: BadgeColor.primary,
                content: '10',
                child: Icon(Icons.mail, size: 32),
              ),
              const NextBadge(
                color: BadgeColor.secondary,
                content: '7',
                child: Icon(Icons.bookmark, size: 32),
              ),
              const NextBadge(
                color: BadgeColor.success,
                content: 'New',
                child: Icon(Icons.check_circle, size: 32),
              ),
              const NextBadge(
                color: BadgeColor.warning,
                content: '!',
                child: Icon(Icons.warning, size: 32),
              ),
              const NextBadge(
                color: BadgeColor.danger,
                content: '99+',
                child: Icon(Icons.error, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'Badge Sizes',
            children: [
              const NextBadge(
                size: BadgeSize.sm,
                content: '5',
                child: Icon(Icons.notifications, size: 24),
              ),
              const NextBadge(
                size: BadgeSize.md,
                content: '10',
                child: Icon(Icons.mail, size: 32),
              ),
              const NextBadge(
                size: BadgeSize.lg,
                content: '15',
                child: Icon(Icons.message, size: 40),
              ),
            ],
          ),
          _buildSection(
            title: 'Badge Placements',
            children: [
              const NextBadge(
                placement: BadgePlacement.topRight,
                content: 'TR',
                child: Icon(Icons.notifications, size: 32),
              ),
              const NextBadge(
                placement: BadgePlacement.topLeft,
                content: 'TL',
                child: Icon(Icons.mail, size: 32),
              ),
              const NextBadge(
                placement: BadgePlacement.bottomRight,
                content: 'BR',
                child: Icon(Icons.message, size: 32),
              ),
              const NextBadge(
                placement: BadgePlacement.bottomLeft,
                content: 'BL',
                child: Icon(Icons.shopping_cart, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'Badge Shapes',
            children: [
              const NextBadge(
                shape: BadgeShape.circle,
                content: '5',
                child: Icon(Icons.notifications, size: 32),
              ),
              const NextBadge(
                shape: BadgeShape.rectangle,
                content: 'New',
                child: Icon(Icons.mail, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'Dot Badge',
            children: [
              const NextBadge(
                isDot: true,
                color: BadgeColor.success,
                child: Icon(Icons.notifications, size: 32),
              ),
              const NextBadge(
                isDot: true,
                color: BadgeColor.danger,
                size: BadgeSize.lg,
                child: Icon(Icons.mail, size: 40),
              ),
            ],
          ),
          _buildSection(
            title: 'Badge Without Outline',
            children: [
              const NextBadge(
                showOutline: false,
                content: '5',
                child: Icon(Icons.notifications, size: 32),
              ),
              const NextBadge(
                showOutline: false,
                color: BadgeColor.danger,
                content: '99+',
                child: Icon(Icons.message, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'One Character Badge',
            children: [
              const NextBadge(
                isOneChar: true,
                content: 'A',
                child: Icon(Icons.mail, size: 32),
              ),
              const NextBadge(
                isOneChar: true,
                color: BadgeColor.primary,
                content: '9',
                child: Icon(Icons.notifications, size: 32),
              ),
            ],
          ),
          _buildSection(
            title: 'Numeric & Widget Content',
            children: [
              const NextBadge(
                content: 99,
                color: BadgeColor.danger,
                child: Icon(Icons.mail, size: 32),
              ),
              const NextBadge(
                content: Icon(Icons.star, size: 12, color: Colors.white),
                color: BadgeColor.warning,
                child: Icon(Icons.card_giftcard, size: 32),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Button Variants',
            children: [
              Button.solid(child: const Text('Solid'), onPressed: () {}),
              Button.bordered(child: const Text('Bordered'), onPressed: () {}),
              Button.light(child: const Text('Light'), onPressed: () {}),
              Button.flat(child: const Text('Flat'), onPressed: () {}),
              Button.ghost(child: const Text('Ghost'), onPressed: () {}),
            ],
          ),
          _buildSection(
            title: 'Button Colors',
            children: [
              Button.solid(child: const Text('Default'), onPressed: () {}),
              Button.solid(
                onPressed: () {},
                color: ButtonColor.primary,
                child: const Text('Primary'),
              ),
              Button.solid(
                onPressed: () {},
                color: ButtonColor.secondary,
                child: const Text('Secondary'),
              ),
              Button.solid(
                onPressed: () {},
                color: ButtonColor.success,
                child: const Text('Success'),
              ),
              Button.solid(
                onPressed: () {},
                color: ButtonColor.warning,
                child: const Text('Warning'),
              ),
              Button.solid(
                onPressed: () {},
                color: ButtonColor.danger,
                child: const Text('Danger'),
              ),
            ],
          ),
          _buildSection(
            title: 'Button Sizes',
            children: [
              Button.solid(
                onPressed: () {},
                size: ButtonSize.sm,
                child: const Text('Small'),
              ),
              Button.solid(
                onPressed: () {},
                size: ButtonSize.md,
                child: const Text('Medium'),
              ),
              Button.solid(
                onPressed: () {},
                size: ButtonSize.lg,
                child: const Text('Large'),
              ),
            ],
          ),
          _buildSection(
            title: 'Button Radius',
            children: [
              Button.solid(
                onPressed: () {},
                radius: ButtonRadius.none,
                child: const Text('None'),
              ),
              Button.solid(
                onPressed: () {},
                radius: ButtonRadius.sm,
                child: const Text('Small'),
              ),
              Button.solid(
                onPressed: () {},
                radius: ButtonRadius.md,
                child: const Text('Medium'),
              ),
              Button.solid(
                onPressed: () {},
                radius: ButtonRadius.lg,
                child: const Text('Large'),
              ),
              Button.solid(
                onPressed: () {},
                radius: ButtonRadius.full,
                child: const Text('Full'),
              ),
            ],
          ),
          _buildSection(
            title: 'Buttons with Icons',
            children: [
              Button.solid(
                startContent: const Icon(Icons.add, size: 18),
                child: const Text('Add Item'),
                onPressed: () {},
              ),
              Button.solid(
                endContent: const Icon(Icons.arrow_forward, size: 18),
                onPressed: () {},
                color: ButtonColor.primary,
                child: const Text('Next'),
              ),
              Button.iconOnly(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
                color: ButtonColor.danger,
              ),
              Button.iconOnly(
                icon: const Icon(Icons.share),
                onPressed: () {},
                variant: ButtonVariant.bordered,
              ),
            ],
          ),
          _buildSection(
            title: 'Loading Buttons',
            children: [
              Button.solid(
                isLoading: true,
                onPressed: () {},
                child: const Text('Loading'),
              ),
              Button.bordered(
                isLoading: true,
                color: ButtonColor.primary,
                onPressed: () {},
                child: const Text('Loading'),
              ),
            ],
          ),
          _buildSection(
            title: 'Disabled Buttons',
            children: [
              Button.solid(
                isDisabled: true,
                onPressed: () {},
                child: const Text('Disabled'),
              ),
              Button.bordered(
                isDisabled: true,
                color: ButtonColor.primary,
                onPressed: () {},
                child: const Text('Disabled'),
              ),
            ],
          ),
          _buildSection(
            title: 'Full Width Buttons',
            children: [
              Button.solid(
                onPressed: () {},
                fullWidth: true,
                color: ButtonColor.primary,
                child: const Text('Full Width Button'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardsTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Basic Cards',
            children: [
              SizedBox(
                width: 300,
                child: NextCard(
                  header: const Text(
                    'Basic Card',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  body: const Text(
                    'This is a basic card with header and body.',
                  ),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Cancel')),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: NextCard(
                  body: const Column(
                    children: [
                      Icon(Icons.favorite, size: 48, color: Colors.red),
                      SizedBox(height: 8),
                      Text('Simple Card'),
                      SizedBox(height: 8),
                      Text('Just body content'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Card Shadows',
            children: [
              SizedBox(
                width: 280,
                child: NextCard(
                  shadow: CardShadow.none,
                  body: const Center(child: Text('No Shadow')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  shadow: CardShadow.sm,
                  body: const Center(child: Text('Small Shadow')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  shadow: CardShadow.md,
                  body: const Center(child: Text('Medium Shadow')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  shadow: CardShadow.lg,
                  body: const Center(child: Text('Large Shadow')),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Card Radius',
            children: [
              SizedBox(
                width: 280,
                child: NextCard(
                  radius: CardRadius.none,
                  body: const Center(child: Text('No Radius')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  radius: CardRadius.sm,
                  body: const Center(child: Text('Small Radius')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  radius: CardRadius.md,
                  body: const Center(child: Text('Medium Radius')),
                ),
              ),
              SizedBox(
                width: 280,
                child: NextCard(
                  radius: CardRadius.lg,
                  body: const Center(child: Text('Large Radius')),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pressable Cards',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: [
                    SizedBox(
                      width: 200,
                      child: NextCard(
                        isPressable: true,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Card 1 pressed!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        body: const Column(
                          children: [
                            Icon(Icons.touch_app, size: 32, color: Colors.blue),
                            SizedBox(height: 8),
                            Text('Tap Me!'),
                            SizedBox(height: 4),
                            Text(
                              'Pressable card',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: NextCard(
                        isPressable: true,
                        shadow: CardShadow.lg,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Interactive card pressed!'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        },
                        header: const Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 8),
                            Text('Interactive'),
                          ],
                        ),
                        body: const Text('This card responds to taps'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card with Blurred Footer',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 320,
                  child: NextCard(
                    header: const Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    body: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Configure your preferences here.'),
                        SizedBox(height: 16),
                        Text('• Enable notifications'),
                        Text('• Dark mode'),
                        Text('• Auto-save'),
                        SizedBox(height: 16),
                      ],
                    ),
                    footer: const Text(
                      'Footer with blur effect',
                      style: TextStyle(fontSize: 12),
                    ),
                    isFooterBlurred: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Custom Card Components',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 350,
                  child: NextCard(
                    children: [
                      const CardHeader(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(Icons.account_circle, size: 32),
                            SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Custom Header',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'With custom padding',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const CardBody(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        child: Text(
                          'This card uses CardHeader, CardBody, and CardFooter '
                          'components directly with custom padding.',
                        ),
                      ),
                      CardFooter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text('Custom Footer'),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Chip Variants',
            children: [
              NextChip.solid(child: const Text('Solid')),
              NextChip.bordered(child: const Text('Bordered')),
              NextChip.light(child: const Text('Light')),
              NextChip.flat(child: const Text('Flat')),
              NextChip.faded(child: const Text('Faded')),
              NextChip.shadow(child: const Text('Shadow')),
              NextChip.dot(child: const Text('Dot')),
            ],
          ),
          _buildSection(
            title: 'Chip Colors',
            children: [
              NextChip.solid(
                color: ChipColor.defaultColor,
                child: const Text('Default'),
              ),
              NextChip.solid(
                color: ChipColor.primary,
                child: const Text('Primary'),
              ),
              NextChip.solid(
                color: ChipColor.secondary,
                child: const Text('Secondary'),
              ),
              NextChip.solid(
                color: ChipColor.success,
                child: const Text('Success'),
              ),
              NextChip.solid(
                color: ChipColor.warning,
                child: const Text('Warning'),
              ),
              NextChip.solid(
                color: ChipColor.danger,
                child: const Text('Danger'),
              ),
            ],
          ),
          _buildSection(
            title: 'Chip Sizes',
            children: [
              NextChip.solid(size: ChipSize.sm, child: const Text('Small')),
              NextChip.solid(size: ChipSize.md, child: const Text('Medium')),
              NextChip.solid(size: ChipSize.lg, child: const Text('Large')),
            ],
          ),
          _buildSection(
            title: 'Chip Radius',
            children: [
              NextChip.solid(
                radius: ChipRadius.none,
                child: const Text('None'),
              ),
              NextChip.solid(radius: ChipRadius.sm, child: const Text('Small')),
              NextChip.solid(
                radius: ChipRadius.md,
                child: const Text('Medium'),
              ),
              NextChip.solid(radius: ChipRadius.lg, child: const Text('Large')),
              NextChip.solid(
                radius: ChipRadius.full,
                child: const Text('Full'),
              ),
            ],
          ),
          _buildSection(
            title: 'Chips with Avatars',
            children: [
              NextChip.solid(
                avatar: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 12,
                  child: Text('A', style: TextStyle(fontSize: 12)),
                ),
                child: const Text('Avatar Chip'),
              ),
              NextChip.bordered(
                avatar: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 12,
                  child: Icon(Icons.person, size: 14),
                ),
                color: ChipColor.success,
                child: const Text('User Chip'),
              ),
            ],
          ),
          _buildSection(
            title: 'Closable Chips',
            children: [
              NextChip.solid(
                child: const Text('Closable'),
                onClose: (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Chip closed'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
              NextChip.bordered(
                color: ChipColor.primary,
                onClose: (_) {},
                child: const Text('With Icon'),
              ),
            ],
          ),
          _buildSection(
            title: 'Chips with Start/End Content',
            children: [
              NextChip.solid(
                startContent: const Icon(Icons.check, size: 16),
                color: ChipColor.success,
                child: const Text('With Start Icon'),
              ),
              NextChip.bordered(
                endContent: const Icon(Icons.arrow_forward, size: 16),
                color: ChipColor.primary,
                child: const Text('With End Icon'),
              ),
            ],
          ),
          _buildSection(
            title: 'Disabled Chips',
            children: [
              const NextChip.solid(isDisabled: true, child: Text('Disabled')),
              const NextChip.bordered(
                isDisabled: true,
                color: ChipColor.primary,
                child: Text('Disabled Bordered'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownsTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        String? selectedAction;
        Set<String> selectedItems = {};

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Dropdown',
                children: [
                  NextDropdown(
                    trigger: NextDropdownTrigger(
                      child: Button.bordered(
                        onPressed: () {},
                        child: const Text('Actions'),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      onAction: (key) {
                        setState(() => selectedAction = key);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Selected: $key'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      children: const [
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
                        NextDropdownItem(
                          itemKey: 'delete',
                          title: 'Delete file',
                          startContent: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'With Description',
                children: [
                  NextDropdown(
                    trigger: NextDropdownTrigger(
                      child: Button.solid(
                        onPressed: () {},
                        color: ButtonColor.primary,
                        child: const Text('Options'),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      children: const [
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
                  ),
                ],
              ),
              _buildSection(
                title: 'With Shortcuts',
                children: [
                  NextDropdown(
                    trigger: NextDropdownTrigger(
                      child: Button.flat(
                        onPressed: () {},
                        child: const Text('Edit'),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      children: const [
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
                        NextDropdownItem(
                          itemKey: 'cut',
                          title: 'Cut',
                          shortcut: '⌘X',
                          startContent: Icon(Icons.content_cut),
                        ),
                        NextDropdownItem(
                          itemKey: 'copy',
                          title: 'Copy',
                          shortcut: '⌘C',
                          startContent: Icon(Icons.content_copy),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Single Selection',
                children: [
                  NextDropdown(
                    closeOnSelect: false,
                    trigger: NextDropdownTrigger(
                      child: Button.bordered(
                        onPressed: () {},
                        color: ButtonColor.success,
                        child: Text(
                          selectedAction != null
                              ? 'Selected: $selectedAction'
                              : 'Select one',
                        ),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      selectionMode: DropdownSelectionMode.single,
                      onAction: (key) => setState(() => selectedAction = key),
                      children: const [
                        NextDropdownItem(itemKey: 'option1', title: 'Option 1'),
                        NextDropdownItem(itemKey: 'option2', title: 'Option 2'),
                        NextDropdownItem(itemKey: 'option3', title: 'Option 3'),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Multiple Selection',
                children: [
                  NextDropdown(
                    closeOnSelect: false,
                    trigger: NextDropdownTrigger(
                      child: Button.bordered(
                        onPressed: () {},
                        color: ButtonColor.warning,
                        child: Text(
                          selectedItems.isEmpty
                              ? 'Select multiple'
                              : 'Selected: ${selectedItems.length}',
                        ),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      selectionMode: DropdownSelectionMode.multiple,
                      selectedKeys: selectedItems,
                      onSelectionChange: (keys) =>
                          setState(() => selectedItems = keys),
                      children: const [
                        NextDropdownItem(itemKey: 'item1', title: 'Item 1'),
                        NextDropdownItem(itemKey: 'item2', title: 'Item 2'),
                        NextDropdownItem(itemKey: 'item3', title: 'Item 3'),
                        NextDropdownItem(itemKey: 'item4', title: 'Item 4'),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'With Sections',
                children: [
                  NextDropdown(
                    trigger: NextDropdownTrigger(
                      child: Button.ghost(
                        onPressed: () {},
                        child: const Text('Menu'),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      children: const [
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
                            NextDropdownItem(
                              itemKey: 'paste',
                              title: 'Paste',
                              startContent: Icon(Icons.content_paste),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Disabled Items',
                children: [
                  NextDropdown(
                    trigger: NextDropdownTrigger(
                      child: Button.solid(
                        onPressed: () {},
                        color: ButtonColor.danger,
                        child: const Text('Actions'),
                      ),
                    ),
                    menu: NextDropdownMenu(
                      disabledKeys: const {'delete'},
                      children: const [
                        NextDropdownItem(
                          itemKey: 'edit',
                          title: 'Edit',
                          startContent: Icon(Icons.edit),
                        ),
                        NextDropdownItem(
                          itemKey: 'duplicate',
                          title: 'Duplicate',
                          startContent: Icon(Icons.copy),
                        ),
                        NextDropdownItem(
                          itemKey: 'delete',
                          title: 'Delete (disabled)',
                          startContent: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputsTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isEmailInvalid = false;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Input Variants',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      variant: InputVariant.flat,
                      label: 'Flat Input',
                      placeholder: 'Enter text...',
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      variant: InputVariant.bordered,
                      label: 'Bordered Input',
                      placeholder: 'Enter text...',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      variant: InputVariant.faded,
                      label: 'Faded Input',
                      placeholder: 'Enter text...',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      variant: InputVariant.underlined,
                      label: 'Underlined Input',
                      placeholder: 'Enter text...',
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Input Examples',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Email',
                      placeholder: 'Enter your email',
                      keyboardType: TextInputType.emailAddress,
                      startContent: const Icon(Icons.email, size: 20),
                      isInvalid: isEmailInvalid,
                      errorMessage: 'Please enter a valid email',
                      onChanged: (value) {
                        setState(() {
                          isEmailInvalid =
                              value.isNotEmpty && !value.contains('@');
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Password',
                      placeholder: 'Enter your password',
                      obscureText: true,
                      startContent: const Icon(Icons.lock, size: 20),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Search',
                      placeholder: 'Search...',
                      isClearable: true,
                      startContent: const Icon(Icons.search, size: 20),
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Message',
                      placeholder: 'Enter your message...',
                      maxLines: 4,
                      description: 'Tell us what you think',
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Input Sizes',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      size: InputSize.sm,
                      label: 'Small',
                      placeholder: 'Small input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      size: InputSize.md,
                      label: 'Medium',
                      placeholder: 'Medium input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      size: InputSize.lg,
                      label: 'Large',
                      placeholder: 'Large input',
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Input Colors',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      color: InputColor.primary,
                      label: 'Primary',
                      placeholder: 'Primary color input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      color: InputColor.secondary,
                      label: 'Secondary',
                      placeholder: 'Secondary color input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      color: InputColor.success,
                      label: 'Success',
                      placeholder: 'Success color input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      color: InputColor.warning,
                      label: 'Warning',
                      placeholder: 'Warning color input',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      color: InputColor.danger,
                      label: 'Danger',
                      placeholder: 'Danger color input',
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Input Radius',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      radius: InputRadius.none,
                      label: 'No Radius',
                      placeholder: 'Square corners',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      radius: InputRadius.sm,
                      label: 'Small Radius',
                      placeholder: 'Small rounded',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      radius: InputRadius.md,
                      label: 'Medium Radius',
                      placeholder: 'Medium rounded',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      radius: InputRadius.lg,
                      label: 'Large Radius',
                      placeholder: 'Large rounded',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      radius: InputRadius.full,
                      label: 'Full Radius',
                      placeholder: 'Pill shape',
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Label Placements',
                children: [
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      labelPlacement: LabelPlacement.inside,
                      label: 'Inside Label',
                      placeholder: 'Enter text...',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      labelPlacement: LabelPlacement.outside,
                      label: 'Outside Label',
                      placeholder: 'Enter text...',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      labelPlacement: LabelPlacement.outsideLeft,
                      label: 'Outside Left',
                      placeholder: 'Enter text...',
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Input States',
                children: [
                  const SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Disabled Input',
                      placeholder: 'This input is disabled',
                      isDisabled: true,
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Read-only Input',
                      value: 'This is read-only',
                      isReadOnly: true,
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Required Input',
                      placeholder: 'This field is required',
                      isRequired: true,
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'With Description & Helper Text',
                children: [
                  const SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Username',
                      placeholder: 'Enter username',
                      description: 'Choose a unique username',
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Email',
                      placeholder: 'Enter email',
                      isInvalid: true,
                      errorMessage: 'Please enter a valid email address',
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'OTP Input',
                children: [
                  NextInputOTP(
                    length: 6,
                    onChanged: (value) {},
                    onCompleted: (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('OTP Completed: $value'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
              _buildSection(
                title: 'OTP with Different Lengths',
                children: [
                  NextInputOTP(
                    length: 4,
                    size: InputSize.lg,
                    color: InputColor.primary,
                  ),
                  NextInputOTP(length: 6, color: InputColor.success),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSwitchesTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool basicSwitch = false;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Switches',
                children: [
                  NextSwitch(
                    isSelected: basicSwitch,
                    onValueChange: (value) =>
                        setState(() => basicSwitch = value),
                  ),
                  NextSwitch(
                    isSelected: true,
                    label: const Text('Switch with Label'),
                    onValueChange: (value) {},
                  ),
                  const NextSwitch(
                    isSelected: false,
                    isDisabled: true,
                    label: Text('Disabled Switch'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Switch Sizes',
                children: [
                  NextSwitch(
                    isSelected: true,
                    size: SwitchSize.sm,
                    label: const Text('Small'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    size: SwitchSize.md,
                    label: const Text('Medium'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    size: SwitchSize.lg,
                    label: const Text('Large'),
                    onValueChange: (value) {},
                  ),
                ],
              ),
              _buildSection(
                title: 'Switch Colors',
                children: [
                  NextSwitch(
                    isSelected: true,
                    color: SwitchColor.primary,
                    label: const Text('Primary'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    color: SwitchColor.secondary,
                    label: const Text('Secondary'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    color: SwitchColor.success,
                    label: const Text('Success'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    color: SwitchColor.warning,
                    label: const Text('Warning'),
                    onValueChange: (value) {},
                  ),
                  NextSwitch(
                    isSelected: true,
                    color: SwitchColor.danger,
                    label: const Text('Danger'),
                    onValueChange: (value) {},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCheckboxTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isChecked1 = false;
        bool isChecked2 = true;
        bool isIndeterminate = true;
        List<String> selectedItems = ['option1'];
        List<String> selectedHorizontal = [];

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Checkboxes',
                children: [
                  NextCheckbox(
                    isSelected: isChecked1,
                    onValueChange: (value) =>
                        setState(() => isChecked1 = value),
                  ),
                  NextCheckbox(
                    isSelected: isChecked2,
                    children: const Text('Checkbox with Label'),
                    onValueChange: (value) =>
                        setState(() => isChecked2 = value),
                  ),
                  const NextCheckbox(
                    isSelected: false,
                    isDisabled: true,
                    children: Text('Disabled Checkbox'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Indeterminate Checkbox',
                children: [
                  NextCheckbox(
                    isIndeterminate: isIndeterminate,
                    children: const Text('Select All'),
                    onValueChange: (value) =>
                        setState(() => isIndeterminate = !isIndeterminate),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Colors',
                children: [
                  const NextCheckbox(
                    isSelected: true,
                    color: CheckboxColor.primary,
                    children: Text('Primary'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    color: CheckboxColor.secondary,
                    children: Text('Secondary'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    color: CheckboxColor.success,
                    children: Text('Success'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    color: CheckboxColor.warning,
                    children: Text('Warning'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    color: CheckboxColor.danger,
                    children: Text('Danger'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Sizes',
                children: [
                  const NextCheckbox(
                    isSelected: true,
                    size: CheckboxSize.sm,
                    children: Text('Small'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    size: CheckboxSize.md,
                    children: Text('Medium'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    size: CheckboxSize.lg,
                    children: Text('Large'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Group - Vertical',
                children: [
                  NextCheckboxGroup(
                    label: 'Select your interests',
                    value: selectedItems,
                    onValueChange: (values) =>
                        setState(() => selectedItems = values),
                    children: const [
                      NextCheckbox(value: 'option1', children: Text('Sports')),
                      NextCheckbox(value: 'option2', children: Text('Music')),
                      NextCheckbox(value: 'option3', children: Text('Travel')),
                      NextCheckbox(value: 'option4', children: Text('Reading')),
                    ],
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Group - Horizontal',
                children: [
                  NextCheckboxGroup(
                    label: 'Horizontal Layout',
                    orientation: CheckboxGroupOrientation.horizontal,
                    value: selectedHorizontal,
                    onValueChange: (values) =>
                        setState(() => selectedHorizontal = values),
                    children: const [
                      NextCheckbox(value: 'yes', children: Text('Yes')),
                      NextCheckbox(value: 'no', children: Text('No')),
                      NextCheckbox(value: 'maybe', children: Text('Maybe')),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        String selectedValue = 'option1';
        String selectedHorizontal = 'yes';
        String selectedColor = 'primary';

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Radio Group - Vertical',
                children: [
                  RadioGroup(
                    label: const Text('Choose your framework'),
                    value: selectedValue,
                    onValueChange: (value) =>
                        setState(() => selectedValue = value ?? ''),
                    children: const [
                      NextRadio(value: 'option1', child: Text('Flutter')),
                      NextRadio(value: 'option2', child: Text('React Native')),
                      NextRadio(value: 'option3', child: Text('Native')),
                    ],
                  ),
                ],
              ),
              _buildSection(
                title: 'Radio Group - Horizontal',
                children: [
                  RadioGroup(
                    label: const Text('Horizontal Layout'),
                    orientation: RadioGroupOrientation.horizontal,
                    value: selectedHorizontal,
                    onValueChange: (value) =>
                        setState(() => selectedHorizontal = value ?? ''),
                    children: const [
                      NextRadio(value: 'yes', child: Text('Yes')),
                      NextRadio(value: 'no', child: Text('No')),
                      NextRadio(value: 'maybe', child: Text('Maybe')),
                    ],
                  ),
                ],
              ),
              _buildSection(
                title: 'Radio Colors',
                children: [
                  RadioGroup(
                    label: const Text('Primary Color'),
                    color: RadioColor.primary,
                    value: selectedColor,
                    onValueChange: (value) =>
                        setState(() => selectedColor = value ?? ''),
                    children: const [
                      NextRadio(value: 'opt1', child: Text('Option 1')),
                      NextRadio(value: 'opt2', child: Text('Option 2')),
                      NextRadio(value: 'opt3', child: Text('Option 3')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const RadioGroup(
                    label: Text('Success Color'),
                    color: RadioColor.success,
                    value: 'opt1',
                    children: [
                      NextRadio(value: 'opt1', child: Text('Option 1')),
                      NextRadio(value: 'opt2', child: Text('Option 2')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const RadioGroup(
                    label: Text('Danger Color'),
                    color: RadioColor.danger,
                    value: 'opt1',
                    children: [
                      NextRadio(value: 'opt1', child: Text('Option 1')),
                      NextRadio(value: 'opt2', child: Text('Option 2')),
                    ],
                  ),
                ],
              ),
              _buildSection(
                title: 'Radio Sizes',
                children: [
                  const RadioGroup(
                    label: Text('Small Size'),
                    size: RadioSize.sm,
                    value: 'opt1',
                    children: [
                      NextRadio(value: 'opt1', child: Text('Small')),
                      NextRadio(value: 'opt2', child: Text('Radio')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const RadioGroup(
                    label: Text('Medium Size'),
                    size: RadioSize.md,
                    value: 'opt1',
                    children: [
                      NextRadio(value: 'opt1', child: Text('Medium')),
                      NextRadio(value: 'opt2', child: Text('Radio')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const RadioGroup(
                    label: Text('Large Size'),
                    size: RadioSize.lg,
                    value: 'opt1',
                    children: [
                      NextRadio(value: 'opt1', child: Text('Large')),
                      NextRadio(value: 'opt2', child: Text('Radio')),
                    ],
                  ),
                ],
              ),
              _buildSection(
                title: 'Disabled Radio',
                children: [
                  const RadioGroup(
                    value: 'option1',
                    children: [
                      NextRadio(value: 'option1', child: Text('Enabled')),
                      NextRadio(
                        value: 'option2',
                        isDisabled: true,
                        child: Text('Disabled'),
                      ),
                      NextRadio(
                        value: 'option3',
                        isDisabled: true,
                        child: Text('Also Disabled'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalsTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isBasicModalOpen = false;
        bool isLargeModalOpen = false;
        bool isTopModalOpen = false;
        bool isNonDismissableModalOpen = false;
        bool isBackdropBlurModalOpen = false;
        bool isDraggableModalOpen = false;
        bool isScrollModalOpen = false;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Modal',
                children: [
                  Button.solid(
                    onPressed: () => setState(() => isBasicModalOpen = true),
                    child: const Text('Open Modal'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Modal Sizes',
                children: [
                  Button.bordered(
                    onPressed: () => setState(() => isLargeModalOpen = true),
                    child: const Text('Large Modal'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Modal Placements',
                children: [
                  Button.flat(
                    onPressed: () => setState(() => isTopModalOpen = true),
                    child: const Text('Top Placement'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Non-dismissible Modal',
                children: [
                  Button.solid(
                    onPressed: () =>
                        setState(() => isNonDismissableModalOpen = true),
                    color: ButtonColor.warning,
                    child: const Text('Non-dismissible'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Backdrop Blur',
                children: [
                  Button.solid(
                    onPressed: () =>
                        setState(() => isBackdropBlurModalOpen = true),
                    color: ButtonColor.primary,
                    child: const Text('Blur Backdrop'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Draggable Modal',
                children: [
                  Button.ghost(
                    onPressed: () =>
                        setState(() => isDraggableModalOpen = true),
                    color: ButtonColor.secondary,
                    child: const Text('Draggable'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Scroll Inside',
                children: [
                  Button.solid(
                    onPressed: () => setState(() => isScrollModalOpen = true),
                    color: ButtonColor.success,
                    child: const Text('Scrollable Content'),
                  ),
                ],
              ),

              // Basic Modal
              NextModal(
                isOpen: isBasicModalOpen,
                onClose: () => setState(() => isBasicModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(child: Text('Modal Title')),
                  body: const NextModalBody(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modal content goes here. This is a basic modal with header, body, and footer sections.',
                        ),
                        SizedBox(height: 16),
                        Text(
                          'You can add any widgets you want inside the modal.',
                        ),
                      ],
                    ),
                  ),
                  footer: NextModalFooter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button.light(
                          onPressed: () =>
                              setState(() => isBasicModalOpen = false),
                          child: const Text('Close'),
                        ),
                        const SizedBox(width: 8),
                        Button.solid(
                          color: ButtonColor.primary,
                          onPressed: () =>
                              setState(() => isBasicModalOpen = false),
                          child: const Text('Action'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Large Modal
              NextModal(
                isOpen: isLargeModalOpen,
                size: ModalSize.lg,
                onClose: () => setState(() => isLargeModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(child: Text('Large Modal')),
                  body: const NextModalBody(
                    child: Text(
                      'This is a large modal. You can configure different sizes like xs, sm, md, lg, xl, and more.',
                    ),
                  ),
                  footer: NextModalFooter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Button.bordered(
                          onPressed: () =>
                              setState(() => isLargeModalOpen = false),
                          child: const Text('Close'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Top Placement Modal
              NextModal(
                isOpen: isTopModalOpen,
                placement: ModalPlacement.top,
                onClose: () => setState(() => isTopModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(child: Text('Top Placement')),
                  body: const NextModalBody(
                    child: Text('This modal appears at the top of the screen.'),
                  ),
                  footer: NextModalFooter(
                    child: Button.solid(
                      onPressed: () => setState(() => isTopModalOpen = false),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ),

              // Non-dismissible Modal
              NextModal(
                isOpen: isNonDismissableModalOpen,
                isDismissable: false,
                isKeyboardDismissDisabled: true,
                onClose: () =>
                    setState(() => isNonDismissableModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(
                    child: Text('Non-dismissible Modal'),
                  ),
                  body: const NextModalBody(
                    child: Text(
                      'This modal cannot be dismissed by clicking outside or pressing ESC. You must use the close button.',
                    ),
                  ),
                  footer: NextModalFooter(
                    child: Button.solid(
                      color: ButtonColor.danger,
                      onPressed: () =>
                          setState(() => isNonDismissableModalOpen = false),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ),

              // Backdrop Blur Modal
              NextModal(
                isOpen: isBackdropBlurModalOpen,
                backdrop: ModalBackdrop.blur,
                onClose: () => setState(() => isBackdropBlurModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(
                    child: Text('Blurred Backdrop'),
                  ),
                  body: const NextModalBody(
                    child: Text(
                      'This modal has a blurred backdrop effect for a modern look.',
                    ),
                  ),
                  footer: NextModalFooter(
                    child: Button.solid(
                      onPressed: () =>
                          setState(() => isBackdropBlurModalOpen = false),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ),

              // Draggable Modal
              NextModal(
                isOpen: isDraggableModalOpen,
                isDraggable: true,
                onClose: () => setState(() => isDraggableModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(child: Text('Draggable Modal')),
                  body: const NextModalBody(
                    child: Text('Try dragging this modal around the screen!'),
                  ),
                  footer: NextModalFooter(
                    child: Button.solid(
                      onPressed: () =>
                          setState(() => isDraggableModalOpen = false),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ),

              // Scroll Inside Modal
              NextModal(
                isOpen: isScrollModalOpen,
                scrollBehavior: ModalScrollBehavior.inside,
                onClose: () => setState(() => isScrollModalOpen = false),
                child: NextModalContent(
                  header: const NextModalHeader(
                    child: Text('Scrollable Content'),
                  ),
                  body: NextModalBody(
                    child: Column(
                      children: List.generate(
                        20,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Item ${index + 1}'),
                        ),
                      ),
                    ),
                  ),
                  footer: NextModalFooter(
                    child: Button.solid(
                      onPressed: () =>
                          setState(() => isScrollModalOpen = false),
                      child: const Text('Close'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Indeterminate Progress',
            children: [
              const NextCircularProgress(isIndeterminate: true),
              const NextCircularProgress(
                isIndeterminate: true,
                label: Text('Loading...'),
              ),
            ],
          ),
          _buildSection(
            title: 'Determinate Progress',
            children: [
              const NextCircularProgress(
                value: 0.3,
                isIndeterminate: false,
                label: Text('30%'),
              ),
              const NextCircularProgress(
                value: 0.5,
                isIndeterminate: false,
                label: Text('50%'),
              ),
              const NextCircularProgress(
                value: 0.7,
                isIndeterminate: false,
                label: Text('70%'),
              ),
              const NextCircularProgress(
                value: 1.0,
                isIndeterminate: false,
                label: Text('100%'),
              ),
            ],
          ),
          _buildSection(
            title: 'Progress Colors',
            children: [
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                color: CircularProgressColor.primary,
                label: Text('Primary'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                color: CircularProgressColor.secondary,
                label: Text('Secondary'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                color: CircularProgressColor.success,
                label: Text('Success'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                color: CircularProgressColor.warning,
                label: Text('Warning'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                color: CircularProgressColor.danger,
                label: Text('Danger'),
              ),
            ],
          ),
          _buildSection(
            title: 'Progress Sizes',
            children: [
              const NextCircularProgress(
                value: 0.75,
                isIndeterminate: false,
                size: CircularProgressSize.sm,
                label: Text('Small'),
              ),
              const NextCircularProgress(
                value: 0.75,
                isIndeterminate: false,
                size: CircularProgressSize.md,
                label: Text('Medium'),
              ),
              const NextCircularProgress(
                value: 0.75,
                isIndeterminate: false,
                size: CircularProgressSize.lg,
                label: Text('Large'),
              ),
            ],
          ),
          _buildSection(
            title: 'Custom Stroke Width',
            children: [
              const NextCircularProgress(
                value: 0.8,
                isIndeterminate: false,
                strokeWidth: 2,
                label: Text('Thin'),
              ),
              const NextCircularProgress(
                value: 0.8,
                isIndeterminate: false,
                strokeWidth: 4,
                label: Text('Default'),
              ),
              const NextCircularProgress(
                value: 0.8,
                isIndeterminate: false,
                strokeWidth: 8,
                label: Text('Thick'),
              ),
            ],
          ),
          _buildSection(
            title: 'With Value Label',
            children: [
              const NextCircularProgress(
                value: 0.45,
                isIndeterminate: false,
                showValueLabel: true,
                color: CircularProgressColor.primary,
              ),
              const NextCircularProgress(
                value: 0.85,
                isIndeterminate: false,
                showValueLabel: true,
                color: CircularProgressColor.success,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTablesTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        final users = [
          _User(id: '1', name: 'Tony Reichert', role: 'CEO', status: 'Active'),
          _User(
            id: '2',
            name: 'Zoey Lang',
            role: 'Tech Lead',
            status: 'Paused',
          ),
          _User(
            id: '3',
            name: 'Jane Fisher',
            role: 'Sr. Dev',
            status: 'Active',
          ),
          _User(
            id: '4',
            name: 'William Howard',
            role: 'C.M.',
            status: 'Vacation',
          ),
        ];

        final columns = [
          TableColumnDef<_User>(
            key: 'name',
            label: 'Name',
            allowsSorting: true,
            builder: (user) => Text(user.name),
          ),
          TableColumnDef<_User>(
            key: 'role',
            label: 'Role',
            builder: (user) => Text(user.role),
          ),
          TableColumnDef<_User>(
            key: 'status',
            label: 'Status',
            builder: (user) => NextChip.flat(
              color: user.status == 'Active'
                  ? ChipColor.success
                  : user.status == 'Paused'
                  ? ChipColor.warning
                  : ChipColor.secondary,
              size: ChipSize.sm,
              child: Text(user.status),
            ),
          ),
        ];

        Set<String> selectedKeys = {};
        TableSortDescriptor? sortDescriptor;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Table',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(columns: columns, rows: users),
                  ),
                ],
              ),
              _buildSection(
                title: 'Striped Table',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      isStriped: true,
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Single Selection',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      selectionMode: TableSelectionMode.single,
                      selectedKeys: selectedKeys,
                      onSelectionChange: (keys) {
                        setState(() => selectedKeys = keys);
                      },
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Multiple Selection',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      selectionMode: TableSelectionMode.multiple,
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Compact Table',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      isCompact: true,
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Without Wrapper',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      removeWrapper: true,
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Sortable Table',
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: users,
                      sortDescriptor: sortDescriptor,
                      onSortChange: (descriptor) {
                        setState(() => sortDescriptor = descriptor);
                      },
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'Empty Table',
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: NextTable<_User>(
                      columns: columns,
                      rows: const [],
                      emptyContent: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inbox, size: 48, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            'No users found',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToastsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Basic Toast',
            children: [
              Button.solid(
                onPressed: () {
                  showToast(
                    context,
                    title: 'Notification',
                    description: 'This is a basic toast notification.',
                  );
                },
                child: const Text('Show Toast'),
              ),
            ],
          ),
          _buildSection(
            title: 'Toast Colors',
            children: [
              Button.solid(
                color: ButtonColor.primary,
                onPressed: () {
                  showToast(
                    context,
                    title: 'Primary Toast',
                    description: 'This is a primary color toast.',
                    icon: const Icon(Icons.info),
                    color: ToastColor.primary,
                  );
                },
                child: const Text('Primary'),
              ),
              Button.solid(
                color: ButtonColor.success,
                onPressed: () {
                  showSuccessToast(
                    context,
                    title: 'Success!',
                    description: 'Your action was completed successfully.',
                  );
                },
                child: const Text('Success'),
              ),
              Button.solid(
                color: ButtonColor.warning,
                onPressed: () {
                  showWarningToast(
                    context,
                    title: 'Warning!',
                    description: 'Please review your input.',
                  );
                },
                child: const Text('Warning'),
              ),
              Button.solid(
                color: ButtonColor.danger,
                onPressed: () {
                  showErrorToast(
                    context,
                    title: 'Error!',
                    description: 'Something went wrong.',
                  );
                },
                child: const Text('Error'),
              ),
              Button.solid(
                color: ButtonColor.secondary,
                onPressed: () {
                  showToast(
                    context,
                    title: 'Secondary Toast',
                    icon: const Icon(Icons.star),
                    color: ToastColor.secondary,
                  );
                },
                child: const Text('Secondary'),
              ),
            ],
          ),
          _buildSection(
            title: 'Toast Variants',
            children: [
              Button.bordered(
                onPressed: () {
                  showToast(
                    context,
                    title: 'Solid Variant',
                    description: 'This is a solid toast.',
                    variant: ToastVariant.solid,
                    color: ToastColor.primary,
                    icon: const Icon(Icons.notifications),
                  );
                },
                child: const Text('Solid'),
              ),
              Button.bordered(
                onPressed: () {
                  showToast(
                    context,
                    title: 'Bordered Variant',
                    description: 'This is a bordered toast.',
                    variant: ToastVariant.bordered,
                    color: ToastColor.success,
                    icon: const Icon(Icons.check_circle),
                  );
                },
                child: const Text('Bordered'),
              ),
              Button.bordered(
                onPressed: () {
                  showToast(
                    context,
                    title: 'Flat Variant',
                    description: 'This is a flat toast.',
                    variant: ToastVariant.flat,
                    color: ToastColor.warning,
                    icon: const Icon(Icons.warning),
                  );
                },
                child: const Text('Flat'),
              ),
            ],
          ),
          _buildSection(
            title: 'With Progress',
            children: [
              Button.flat(
                color: ButtonColor.primary,
                onPressed: () {
                  showToast(
                    context,
                    title: 'Auto-dismiss in 5s',
                    description: 'Watch the progress bar.',
                    timeout: 5000,
                    shouldShowTimeoutProgress: true,
                    icon: const Icon(Icons.timelapse),
                    color: ToastColor.primary,
                  );
                },
                child: const Text('Toast with Progress'),
              ),
            ],
          ),
          _buildSection(
            title: 'Without Icons',
            children: [
              Button.ghost(
                onPressed: () {
                  showToast(
                    context,
                    title: 'No Icon Toast',
                    description: 'This toast has no icon.',
                    hideIcon: true,
                  );
                },
                child: const Text('Hide Icon'),
              ),
            ],
          ),
          _buildSection(
            title: 'Without Close Button',
            children: [
              Button.light(
                color: ButtonColor.secondary,
                onPressed: () {
                  showToast(
                    context,
                    title: 'No Close Button',
                    description: 'This toast will auto-dismiss.',
                    hideCloseButton: true,
                    timeout: 3000,
                  );
                },
                child: const Text('No Close Button'),
              ),
            ],
          ),
          _buildSection(
            title: 'Custom Close Icon',
            children: [
              Button.bordered(
                color: ButtonColor.danger,
                onPressed: () {
                  showToast(
                    context,
                    title: 'Custom Close Icon',
                    description: 'This toast has a custom close icon.',
                    closeIcon: const Icon(Icons.cancel, size: 18),
                    color: ToastColor.danger,
                    icon: const Icon(Icons.info),
                  );
                },
                child: const Text('Custom Close Icon'),
              ),
            ],
          ),
          _buildSection(
            title: 'Multiple Toasts',
            children: [
              Builder(
                builder: (context) => Button.solid(
                  color: ButtonColor.primary,
                  onPressed: () {
                    showSuccessToast(context, title: 'Toast 1');
                    Future.delayed(const Duration(milliseconds: 200), () {
                      if (context.mounted) {
                        showWarningToast(context, title: 'Toast 2');
                      }
                    });
                    Future.delayed(const Duration(milliseconds: 400), () {
                      if (context.mounted) {
                        showErrorToast(context, title: 'Toast 3');
                      }
                    });
                  },
                  child: const Text('Show Multiple'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTooltipsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Basic Tooltip',
            children: [
              NextTooltip(
                content: 'This is a tooltip',
                child: Button.bordered(
                  onPressed: () {},
                  child: const Text('Hover me'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Tooltip Colors',
            children: [
              NextTooltip(
                content: 'Default tooltip',
                color: TooltipColor.defaultColor,
                child: Button.solid(
                  onPressed: () {},
                  child: const Text('Default'),
                ),
              ),
              NextTooltip(
                content: 'Primary tooltip',
                color: TooltipColor.primary,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.primary,
                  child: const Text('Primary'),
                ),
              ),
              NextTooltip(
                content: 'Success tooltip',
                color: TooltipColor.success,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.success,
                  child: const Text('Success'),
                ),
              ),
              NextTooltip(
                content: 'Warning tooltip',
                color: TooltipColor.warning,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.warning,
                  child: const Text('Warning'),
                ),
              ),
              NextTooltip(
                content: 'Danger tooltip',
                color: TooltipColor.danger,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.danger,
                  child: const Text('Danger'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Tooltip Sizes',
            children: [
              NextTooltip(
                content: 'Small tooltip',
                size: TooltipSize.sm,
                child: Button.bordered(
                  onPressed: () {},
                  child: const Text('Small'),
                ),
              ),
              NextTooltip(
                content: 'Medium tooltip',
                size: TooltipSize.md,
                child: Button.bordered(
                  onPressed: () {},
                  child: const Text('Medium'),
                ),
              ),
              NextTooltip(
                content: 'Large tooltip',
                size: TooltipSize.lg,
                child: Button.bordered(
                  onPressed: () {},
                  child: const Text('Large'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'With Arrow',
            children: [
              NextTooltip(
                content: 'Tooltip with arrow',
                showArrow: true,
                color: TooltipColor.primary,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.primary,
                  child: const Text('Top'),
                ),
              ),
              NextTooltip(
                content: 'Bottom arrow',
                showArrow: true,
                placement: TooltipPlacement.bottom,
                color: TooltipColor.success,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.success,
                  child: const Text('Bottom'),
                ),
              ),
              NextTooltip(
                content: 'Left arrow',
                showArrow: true,
                placement: TooltipPlacement.left,
                color: TooltipColor.warning,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.warning,
                  child: const Text('Left'),
                ),
              ),
              NextTooltip(
                content: 'Right arrow',
                showArrow: true,
                placement: TooltipPlacement.right,
                color: TooltipColor.danger,
                child: Button.solid(
                  onPressed: () {},
                  color: ButtonColor.danger,
                  child: const Text('Right'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'Tooltip Placements',
            children: [
              NextTooltip(
                content: 'Top',
                placement: TooltipPlacement.top,
                child: Button.ghost(onPressed: () {}, child: const Text('Top')),
              ),
              NextTooltip(
                content: 'Bottom',
                placement: TooltipPlacement.bottom,
                child: Button.ghost(
                  onPressed: () {},
                  child: const Text('Bottom'),
                ),
              ),
              NextTooltip(
                content: 'Left',
                placement: TooltipPlacement.left,
                child: Button.ghost(
                  onPressed: () {},
                  child: const Text('Left'),
                ),
              ),
              NextTooltip(
                content: 'Right',
                placement: TooltipPlacement.right,
                child: Button.ghost(
                  onPressed: () {},
                  child: const Text('Right'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'With Custom Offset',
            children: [
              NextTooltip(
                content: 'Offset 15px',
                offset: 15,
                showArrow: true,
                color: TooltipColor.primary,
                child: Button.bordered(
                  onPressed: () {},
                  color: ButtonColor.primary,
                  child: const Text('Large Offset'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'With Delay',
            children: [
              NextTooltip(
                content: 'Appears after 1 second',
                delay: 1000,
                color: TooltipColor.warning,
                child: Button.flat(
                  onPressed: () {},
                  color: ButtonColor.warning,
                  child: const Text('Delayed Tooltip'),
                ),
              ),
            ],
          ),
          _buildSection(
            title: 'On Icons',
            children: [
              const NextTooltip(
                content: 'Information',
                color: TooltipColor.primary,
                showArrow: true,
                child: Icon(Icons.info, size: 32),
              ),
              const NextTooltip(
                content: 'Help',
                color: TooltipColor.secondary,
                showArrow: true,
                child: Icon(Icons.help, size: 32),
              ),
              const NextTooltip(
                content: 'Settings',
                color: TooltipColor.defaultColor,
                showArrow: true,
                child: Icon(Icons.settings, size: 32),
              ),
              const NextTooltip(
                content: 'Delete',
                color: TooltipColor.danger,
                showArrow: true,
                placement: TooltipPlacement.bottom,
                child: Icon(Icons.delete, size: 32, color: Colors.red),
              ),
            ],
          ),
          _buildSection(
            title: 'Disabled Tooltip',
            children: [
              NextTooltip(
                content: 'This tooltip is disabled',
                isDisabled: true,
                child: Button.bordered(
                  onPressed: () {},
                  child: const Text('Disabled Tooltip'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// User data class for table examples
class _User {
  _User({
    required this.id,
    required this.name,
    required this.role,
    required this.status,
  });

  final String id;
  final String name;
  final String role;
  final String status;
}
