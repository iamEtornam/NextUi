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
      title: 'Next UI Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ComponentShowcasePage(),
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
            Tab(text: 'Buttons'),
            Tab(text: 'Cards'),
            Tab(text: 'Chips'),
            Tab(text: 'Inputs'),
            Tab(text: 'Switches'),
            Tab(text: 'Checkboxes'),
            Tab(text: 'Radio Groups'),
            Tab(text: 'Progress'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildButtonsTab(),
          _buildCardsTab(),
          _buildChipsTab(),
          _buildInputsTab(),
          _buildSwitchesTab(),
          _buildCheckboxTab(),
          _buildRadioTab(),
          _buildProgressTab(),
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
            ],
          ),
          _buildSection(
            title: 'Button Colors',
            children: [
              Button.solid(
                child: const Text('Primary'),
                onPressed: () {},
                color: ButtonColor.primary,
              ),
              Button.solid(
                child: const Text('Secondary'),
                onPressed: () {},
                color: ButtonColor.secondary,
              ),
              Button.solid(
                child: const Text('Success'),
                onPressed: () {},
                color: ButtonColor.success,
              ),
              Button.solid(
                child: const Text('Warning'),
                onPressed: () {},
                color: ButtonColor.warning,
              ),
              Button.solid(
                child: const Text('Danger'),
                onPressed: () {},
                color: ButtonColor.danger,
              ),
            ],
          ),
          _buildSection(
            title: 'Button Sizes',
            children: [
              Button.solid(
                child: const Text('Small'),
                onPressed: () {},
                size: ButtonSize.sm,
              ),
              Button.solid(
                child: const Text('Medium'),
                onPressed: () {},
                size: ButtonSize.md,
              ),
              Button.solid(
                child: const Text('Large'),
                onPressed: () {},
                size: ButtonSize.lg,
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
            title: 'Chip Colors',
            children: [
              NextChip.solid(
                child: const Text('Primary'),
                color: ChipColor.primary,
              ),
              NextChip.solid(
                child: const Text('Secondary'),
                color: ChipColor.secondary,
              ),
              NextChip.solid(
                child: const Text('Success'),
                color: ChipColor.success,
              ),
              NextChip.solid(
                child: const Text('Warning'),
                color: ChipColor.warning,
              ),
              NextChip.solid(
                child: const Text('Danger'),
                color: ChipColor.danger,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputsTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        String emailValue = '';
        String passwordValue = '';
        String searchValue = '';
        String textareaValue = '';
        String otpValue = '';
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
                      onChanged: (value) => setState(() => emailValue = value),
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
                      errorMessage: isEmailInvalid
                          ? 'Please enter a valid email'
                          : null,
                      onChanged: (value) {
                        setState(() {
                          emailValue = value;
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
                      onChanged: (value) =>
                          setState(() => passwordValue = value),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Search',
                      placeholder: 'Search...',
                      isClearable: true,
                      startContent: const Icon(Icons.search, size: 20),
                      onChanged: (value) => setState(() => searchValue = value),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: NextInput(
                      label: 'Message',
                      placeholder: 'Enter your message...',
                      maxLines: 4,
                      description: 'Tell us what you think',
                      onChanged: (value) =>
                          setState(() => textareaValue = value),
                    ),
                  ),
                ],
              ),
              _buildSection(
                title: 'OTP Input',
                children: [
                  NextInputOTP(
                    length: 6,
                    onChanged: (value) => setState(() => otpValue = value),
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
        bool notificationSwitch = true;
        bool darkModeSwitch = false;
        bool wifiSwitch = true;
        bool bluetoothSwitch = false;
        bool airplaneModeSwitch = false;

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
        List<String> selectedItems = ['option1'];

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
                title: 'Checkbox Group',
                children: [
                  NextCheckboxGroup(
                    value: selectedItems,
                    onValueChange: (values) =>
                        setState(() => selectedItems = values),
                    children: const [
                      NextCheckbox(
                        value: 'option1',
                        children: Text('Option 1'),
                      ),
                      NextCheckbox(
                        value: 'option2',
                        children: Text('Option 2'),
                      ),
                      NextCheckbox(
                        value: 'option3',
                        children: Text('Option 3'),
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

  Widget _buildRadioTab() {
    return StatefulBuilder(
      builder: (context, setState) {
        String selectedValue = 'option1';

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                title: 'Radio Group',
                children: [
                  RadioGroup(
                    value: selectedValue,
                    onValueChange: (value) =>
                        setState(() => selectedValue = value ?? ''),
                    children: const [
                      NextRadio(value: 'option1', child: Text('Option 1')),
                      NextRadio(value: 'option2', child: Text('Option 2')),
                      NextRadio(value: 'option3', child: Text('Option 3')),
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

  Widget _buildProgressTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection(
            title: 'Circular Progress',
            children: [
              const NextCircularProgress(value: 0.3, label: Text('30%')),
              const NextCircularProgress(
                value: 0.7,
                color: CircularProgressColor.success,
              ),
              const NextCircularProgress(
                isIndeterminate: true,
                color: CircularProgressColor.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
