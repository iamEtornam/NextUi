import 'package:flutter/material.dart';
import 'package:next_ui/next_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next UI Components Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ComponentsDemoPage(),
    );
  }
}

class ComponentsDemoPage extends StatefulWidget {
  const ComponentsDemoPage({super.key});

  @override
  State<ComponentsDemoPage> createState() => _ComponentsDemoPageState();
}

class _ComponentsDemoPageState extends State<ComponentsDemoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(spacing: 16, runSpacing: 16, children: children),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next UI Components'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Buttons'),
            Tab(text: 'Cards'),
            Tab(text: 'Chips'),
            Tab(text: 'Checkboxes'),
            Tab(text: 'Radio Groups'),
            Tab(text: 'Progress'),
            Tab(text: 'Typography'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildButtonsTab(),
          _buildCardsTab(),
          _buildChipsTab(),
          _buildCheckboxTab(),
          _buildRadioTab(),
          _buildProgressTab(),
          _buildTypographyTab(),
        ],
      ),
    );
  }

  Widget _buildButtonsTab() {
    return SingleChildScrollView(
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
              Button(
                variant: ButtonVariant.faded,
                child: const Text('Faded'),
                onPressed: () {},
              ),
              Button(
                variant: ButtonVariant.shadow,
                child: const Text('Shadow'),
                onPressed: () {},
              ),
            ],
          ),
          _buildSection(
            title: 'Button Sizes',
            children: [
              Button.solid(
                size: ButtonSize.sm,
                child: const Text('Small'),
                onPressed: () {},
              ),
              Button.solid(
                size: ButtonSize.md,
                child: const Text('Medium'),
                onPressed: () {},
              ),
              Button.solid(
                size: ButtonSize.lg,
                child: const Text('Large'),
                onPressed: () {},
              ),
            ],
          ),
          _buildSection(
            title: 'Button Colors',
            children: [
              Button.solid(
                color: ButtonColor.primary,
                child: const Text('Primary'),
                onPressed: () {},
              ),
              Button.solid(
                color: ButtonColor.secondary,
                child: const Text('Secondary'),
                onPressed: () {},
              ),
              Button.solid(
                color: ButtonColor.success,
                child: const Text('Success'),
                onPressed: () {},
              ),
              Button.solid(
                color: ButtonColor.warning,
                child: const Text('Warning'),
                onPressed: () {},
              ),
              Button.solid(
                color: ButtonColor.danger,
                child: const Text('Danger'),
                onPressed: () {},
              ),
            ],
          ),
          _buildSection(
            title: 'Button States',
            children: [
              Button.solid(child: const Text('Normal'), onPressed: () {}),
              Button.solid(
                isLoading: true,
                onPressed: () {},
                child: const Text('Loading'),
              ),
              Button.solid(
                isDisabled: true,
                onPressed: () {},
                child: const Text('Disabled'),
              ),
            ],
          ),
          _buildSection(
            title: 'Button with Icons',
            children: [
              Button.solid(
                startContent: const Icon(Icons.download, size: 16),
                child: const Text('Download'),
                onPressed: () {},
              ),
              Button.solid(
                endContent: const Icon(Icons.arrow_forward, size: 16),
                child: const Text('Next'),
                onPressed: () {},
              ),
              Button.iconOnly(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
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
                  body: const Text('This is a basic card with header and body.'),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: () {}, child: const Text('Cancel')),
                      const SizedBox(width: 8),
                      ElevatedButton(onPressed: () {}, child: const Text('Save')),
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
                            Text('Pressable card', style: TextStyle(fontSize: 12)),
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
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Text(
                          'This card uses CardHeader, CardBody, and CardFooter '
                          'components directly with custom padding.',
                        ),
                      ),
                      CardFooter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            const Text('Custom Footer'),
                            const SizedBox(width: 4),
                            const Icon(Icons.star, color: Colors.amber, size: 16),
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
            title: 'Chip Sizes',
            children: [
              NextChip.solid(size: ChipSize.sm, child: const Text('Small')),
              NextChip.solid(size: ChipSize.md, child: const Text('Medium')),
              NextChip.solid(size: ChipSize.lg, child: const Text('Large')),
            ],
          ),
          _buildSection(
            title: 'Chip Colors',
            children: [
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
            title: 'Chip with Close Button',
            children: [
              NextChip.solid(
                child: const Text('Closable'),
                onClose: (event) {},
              ),
              NextChip.bordered(
                child: const Text('Remove Me'),
                onClose: (event) {},
              ),
            ],
          ),
          _buildSection(
            title: 'Chip with Avatar',
            children: [
              NextChip.solid(
                avatar: const CircleAvatar(radius: 10, child: Text('A')),
                child: const Text('With Avatar'),
              ),
              NextChip.light(
                avatar: const Icon(Icons.person, size: 16),
                child: const Text('User Chip'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxTab() {
    bool checkbox1 = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Basic Checkboxes',
                children: [
                  NextCheckbox(
                    isSelected: checkbox1,
                    onValueChange: (value) {
                      setState(() {
                        checkbox1 = value;
                      });
                    },
                    children: const Text('Checkbox'),
                  ),
                  const NextCheckbox(
                    isSelected: true,
                    children: Text('Checked'),
                  ),
                  const NextCheckbox(
                    isIndeterminate: true,
                    children: Text('Indeterminate'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Sizes',
                children: [
                  NextCheckbox(
                    size: CheckboxSize.sm,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Small'),
                  ),
                  NextCheckbox(
                    size: CheckboxSize.md,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Medium'),
                  ),
                  NextCheckbox(
                    size: CheckboxSize.lg,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Large'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox Colors',
                children: [
                  NextCheckbox(
                    color: CheckboxColor.primary,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Primary'),
                  ),
                  NextCheckbox(
                    color: CheckboxColor.success,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Success'),
                  ),
                  NextCheckbox(
                    color: CheckboxColor.warning,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Warning'),
                  ),
                  NextCheckbox(
                    color: CheckboxColor.danger,
                    isSelected: true,
                    onValueChange: (value) {},
                    children: const Text('Danger'),
                  ),
                ],
              ),
              _buildSection(
                title: 'Checkbox States',
                children: [
                  const NextCheckbox(
                    isDisabled: true,
                    children: Text('Disabled'),
                  ),
                  const NextCheckbox(
                    isReadOnly: true,
                    isSelected: true,
                    children: Text('Read Only'),
                  ),
                  const NextCheckbox(
                    isInvalid: true,
                    children: Text('Invalid'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Checkbox Group',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    NextCheckboxGroup(
                      label: 'Select your interests',
                      value: const ['option1'],
                      onValueChange: (values) {
                        // Handle checkbox group changes
                      },
                      children: const [
                        NextGroupCheckbox(
                          value: 'option1',
                          children: Text('Sports'),
                        ),
                        NextGroupCheckbox(
                          value: 'option2',
                          children: Text('Music'),
                        ),
                        NextGroupCheckbox(
                          value: 'option3',
                          children: Text('Travel'),
                        ),
                        NextGroupCheckbox(
                          value: 'option4',
                          children: Text('Reading'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRadioTab() {
    String radioValue = 'option1';

    return StatefulBuilder(
      builder: (context, setState) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Radio Group',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RadioGroup(
                  label: const Text('Choose your favorite framework'),
                  value: radioValue,
                  onValueChange: (value) {
                    setState(() {
                      radioValue = value ?? '';
                    });
                  },
                  children: const [
                    NextRadio(value: 'option1', child: Text('Flutter')),
                    NextRadio(value: 'option2', child: Text('React Native')),
                    NextRadio(value: 'option3', child: Text('Native')),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Radio Group - Different Sizes',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RadioGroup(
                  label: const Text('Select size'),
                  size: RadioSize.lg,
                  color: RadioColor.success,
                  children: const [
                    NextRadio(value: 'size_sm', child: Text('Small')),
                    NextRadio(value: 'size_md', child: Text('Medium')),
                    NextRadio(value: 'size_lg', child: Text('Large')),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Horizontal Radio Group',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                RadioGroup(
                  label: const Text('Select payment method'),
                  orientation: RadioGroupOrientation.horizontal,
                  color: RadioColor.warning,
                  children: const [
                    NextRadio(value: 'credit', child: Text('Credit Card')),
                    NextRadio(value: 'paypal', child: Text('PayPal')),
                    NextRadio(value: 'crypto', child: Text('Crypto')),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Basic Circular Progress',
            children: [
              const NextCircularProgress(label: Text('Loading...')),
              const NextCircularProgress(
                value: 0.7,
                isIndeterminate: false,
                label: Text('70% Complete'),
              ),
            ],
          ),
          _buildSection(
            title: 'Progress Sizes',
            children: [
              const NextCircularProgress(
                size: CircularProgressSize.sm,
                value: 0.6,
                isIndeterminate: false,
                label: Text('Small'),
              ),
              const NextCircularProgress(
                size: CircularProgressSize.md,
                value: 0.6,
                isIndeterminate: false,
                label: Text('Medium'),
              ),
              const NextCircularProgress(
                size: CircularProgressSize.lg,
                value: 0.6,
                isIndeterminate: false,
                label: Text('Large'),
              ),
            ],
          ),
          _buildSection(
            title: 'Progress Colors',
            children: [
              const NextCircularProgress(
                color: CircularProgressColor.primary,
                value: 0.8,
                isIndeterminate: false,
                label: Text('Primary'),
              ),
              const NextCircularProgress(
                color: CircularProgressColor.success,
                value: 0.8,
                isIndeterminate: false,
                label: Text('Success'),
              ),
              const NextCircularProgress(
                color: CircularProgressColor.warning,
                value: 0.8,
                isIndeterminate: false,
                label: Text('Warning'),
              ),
              const NextCircularProgress(
                color: CircularProgressColor.danger,
                value: 0.8,
                isIndeterminate: false,
                label: Text('Danger'),
              ),
            ],
          ),
          _buildSection(
            title: 'Custom Stroke Width',
            children: [
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                strokeWidth: 1,
                label: Text('Thin'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                strokeWidth: 4,
                label: Text('Thick'),
              ),
              const NextCircularProgress(
                value: 0.6,
                isIndeterminate: false,
                strokeWidth: 8,
                label: Text('Extra Thick'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypographyTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Typography Components',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Using NextUiText static methods
            NextUiText.h1Bold('H1 Bold Text'),
            const SizedBox(height: 8),
            NextUiText.h2Medium('H2 Medium Text'),
            const SizedBox(height: 8),
            NextUiText.h3Regular('H3 Regular Text'),
            const SizedBox(height: 8),
            NextUiText.h4Bold('H4 Bold Text'),
            const SizedBox(height: 8),
            NextUiText.paragraphRegular(
              'This is regular paragraph text suitable for most content.',
            ),
            const SizedBox(height: 8),
            NextUiText.descriptionMedium(
              'This is medium description text for secondary content.',
            ),
            const SizedBox(height: 8),
            NextUiText.captionRegular('Caption text for small details'),
            const SizedBox(height: 8),
            NextUiText.subHeadingBold('Subheading Bold'),
            const SizedBox(height: 24),

            // Text with custom colors
            NextUiText.h4Bold('Colored Text Examples', textColor: Colors.blue),
            const SizedBox(height: 8),
            NextUiText.paragraphRegular(
              'This paragraph has custom color.',
              textColor: Colors.green,
            ),
            const SizedBox(height: 8),
            NextUiText.captionMedium(
              'Warning caption text.',
              textColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
