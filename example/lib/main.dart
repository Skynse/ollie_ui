import 'package:flutter/material.dart';
import 'package:ollie_ui/ollie_ui.dart';

void main() {
  runApp(const OllieUIExampleApp());
}

class OllieUIExampleApp extends StatelessWidget {
  const OllieUIExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ollie UI Showcase',
      debugShowCheckedModeBanner: false,
      theme: OllieTheme.lightTheme,
      darkTheme: OllieTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const ShowcaseHomePage(),
    );
  }
}

class ShowcaseHomePage extends StatefulWidget {
  const ShowcaseHomePage({super.key});

  @override
  State<ShowcaseHomePage> createState() => _ShowcaseHomePageState();
}

class _ShowcaseHomePageState extends State<ShowcaseHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _searchController = TextEditingController();
  final _multilineController = TextEditingController();
  bool _isLoading = false;
  bool _showError = false;

  // New component states
  bool _checkboxValue = false;
  List<String> _checkboxGroupValues = [];
  bool _switchValue = false;
  String? _dropdownValue;
  String _radioValue = 'option1';
  List<_TableRow> _selectedTableRows = [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _searchController.dispose();
    _multilineController.dispose();
    super.dispose();
  }

  void _simulateLoading() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        OllieToast.success(context, 'Operation completed successfully!');
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => OllieDialog(
        title: 'Example Dialog',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This is a modern, clean dialog component. You can put any content here.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            OllieTextfield.simple(label: 'Your name', hint: 'Enter your name'),
          ],
        ),
        actions: [
          OllieButton.outline(
            text: 'Cancel',
            onPressed: () => Navigator.of(context).pop(),
            width: 100,
            height: 40,
          ),
          OllieButton(
            text: 'Confirm',
            onPressed: () {
              Navigator.of(context).pop();
              OllieToast.success(context, 'Dialog confirmed!');
            },
            width: 100,
            height: 40,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Ollie UI Component Showcase'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSection(
                  'Buttons',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Primary Variants',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OllieButton(
                            text: 'Primary',
                            onPressed: () => OllieToast.info(
                              context,
                              'Primary button clicked',
                            ),
                          ),
                          OllieButton.secondary(
                            text: 'Secondary',
                            onPressed: () => OllieToast.info(
                              context,
                              'Secondary button clicked',
                            ),
                          ),
                          OllieButton.outline(
                            text: 'Outline',
                            onPressed: () => OllieToast.info(
                              context,
                              'Outline button clicked',
                            ),
                          ),
                          OllieButton.danger(
                            text: 'Danger',
                            onPressed: () => OllieToast.warning(
                              context,
                              'Danger button clicked',
                            ),
                          ),
                          OllieButton.text(
                            text: 'Text Button',
                            onPressed: () =>
                                OllieToast.info(context, 'Text button clicked'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'With Icons',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OllieButton.icon(
                            text: 'Download',
                            icon: Icons.download,
                            onPressed: () =>
                                OllieToast.success(context, 'Download started'),
                          ),
                          OllieButton.secondary(
                            text: 'Upload',
                            icon: Icons.upload,
                            onPressed: () =>
                                OllieToast.success(context, 'Upload started'),
                          ),
                          OllieButton.outline(
                            text: 'Settings',
                            icon: Icons.settings,
                            onPressed: () =>
                                OllieToast.info(context, 'Opening settings'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'States',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OllieButton(
                            text: 'Loading',
                            onPressed: _simulateLoading,
                            loading: _isLoading,
                          ),
                          OllieButton(
                            text: 'Disabled',
                            onPressed: () {},
                            disabled: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Text Fields',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OllieTextfield.email(
                        controller: _emailController,
                        helperText: 'We\'ll never share your email',
                      ),
                      const SizedBox(height: 16),
                      OllieTextfield.password(
                        controller: _passwordController,
                        errorText: _showError ? 'Password is required' : null,
                      ),
                      const SizedBox(height: 16),
                      OllieTextfield.search(controller: _searchController),
                      const SizedBox(height: 16),
                      OllieTextfield.multiline(
                        label: 'Comments',
                        hint: 'Enter your comments here...',
                        controller: _multilineController,
                        maxLength: 500,
                      ),
                      const SizedBox(height: 16),
                      OllieTextfield(
                        label: 'Disabled Field',
                        hint: 'This field is disabled',
                        enabled: false,
                      ),
                      const SizedBox(height: 16),
                      OllieButton(
                        text: 'Toggle Error',
                        onPressed: () =>
                            setState(() => _showError = !_showError),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Toasts',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Click the buttons to see different toast notifications appear at the top',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          OllieButton(
                            text: 'Success Toast',
                            onPressed: () => OllieToast.success(
                              context,
                              'Operation successful!',
                            ),
                            width: 150,
                          ),
                          OllieButton.danger(
                            text: 'Error Toast',
                            onPressed: () => OllieToast.error(
                              context,
                              'Something went wrong!',
                            ),
                            width: 150,
                          ),
                          OllieButton.secondary(
                            text: 'Info Toast',
                            onPressed: () => OllieToast.info(
                              context,
                              'Here is some information',
                            ),
                            width: 150,
                          ),
                          OllieButton.outline(
                            text: 'Warning Toast',
                            onPressed: () => OllieToast.warning(
                              context,
                              'Please be careful!',
                            ),
                            width: 150,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Dialogs',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Modern dialogs with customizable content and actions',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      OllieButton(
                        text: 'Show Dialog',
                        onPressed: _showDialog,
                        icon: Icons.open_in_new,
                        width: 150,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Context Menu',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Right-click (or long-press on mobile) on the box below to see the context menu',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      OllieContextMenu(
                        menuWidth: 200,
                        items: [
                          OllieMenuItem(
                            title: 'Open',
                            icon: Icons.open_in_new,
                            onTap: () =>
                                OllieToast.info(context, 'Open clicked'),
                          ),
                          OllieMenuItem(
                            title: 'Edit',
                            icon: Icons.edit,
                            onTap: () =>
                                OllieToast.info(context, 'Edit clicked'),
                          ),
                          OllieMenuItem(
                            title: 'More Actions',
                            icon: Icons.more_horiz,
                            subItems: [
                              OllieMenuItem(
                                title: 'Duplicate',
                                icon: Icons.content_copy,
                                onTap: () =>
                                    OllieToast.success(context, 'Duplicated!'),
                              ),
                              OllieMenuItem(
                                title: 'Archive',
                                icon: Icons.archive,
                                onTap: () =>
                                    OllieToast.info(context, 'Archived'),
                              ),
                            ],
                          ),
                          OllieMenuItem(
                            title: 'Delete',
                            icon: Icons.delete,
                            onTap: () => OllieToast.error(context, 'Deleted!'),
                          ),
                        ],
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.touch_app,
                                  size: 48,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Right-click here',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Cards',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Content containers with various styles',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          OllieCard(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Elevated Card',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'This card has elevation and shadow',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          OllieCard.flat(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Flat Card',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'This card has no elevation',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          OllieCard(
                            width: 200,
                            onTap: () =>
                                OllieToast.info(context, 'Card tapped!'),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Clickable Card',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Click me!',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Checkboxes',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OllieCheckbox(
                        value: _checkboxValue,
                        onChanged: (value) =>
                            setState(() => _checkboxValue = value ?? false),
                        label: 'Accept terms and conditions',
                      ),
                      const SizedBox(height: 16),
                      OllieCheckbox(
                        value: false,
                        onChanged: null,
                        label: 'Disabled checkbox',
                        disabled: true,
                      ),
                      const SizedBox(height: 24),
                      OllieCheckboxGroup(
                        label: 'Select your interests',
                        options: const [
                          OllieCheckboxOption(value: 'sports', label: 'Sports'),
                          OllieCheckboxOption(value: 'music', label: 'Music'),
                          OllieCheckboxOption(value: 'art', label: 'Art'),
                          OllieCheckboxOption(
                            value: 'tech',
                            label: 'Technology',
                          ),
                        ],
                        values: _checkboxGroupValues,
                        onChanged: (values) =>
                            setState(() => _checkboxGroupValues = values),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Switches',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OllieSwitch(
                        value: _switchValue,
                        onChanged: (value) =>
                            setState(() => _switchValue = value),
                        label: 'Enable notifications',
                      ),
                      const SizedBox(height: 16),
                      OllieSwitch(
                        value: true,
                        onChanged: null,
                        label: 'Disabled switch',
                        disabled: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Dropdowns',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OllieDropdown<String>(
                        label: 'Select your country',
                        hint: 'Choose a country',
                        value: _dropdownValue,
                        items: const [
                          OllieDropdownItem(
                            value: 'us',
                            label: 'United States',
                            icon: Icons.flag,
                          ),
                          OllieDropdownItem(
                            value: 'uk',
                            label: 'United Kingdom',
                            icon: Icons.flag,
                          ),
                          OllieDropdownItem(
                            value: 'ca',
                            label: 'Canada',
                            icon: Icons.flag,
                          ),
                          OllieDropdownItem(
                            value: 'au',
                            label: 'Australia',
                            icon: Icons.flag,
                          ),
                        ],
                        onChanged: (value) =>
                            setState(() => _dropdownValue = value),
                        helperText:
                            'Select the country you currently reside in',
                      ),
                      const SizedBox(height: 16),
                      OllieDropdown<String>(
                        label: 'Disabled dropdown',
                        hint: 'This is disabled',
                        items: const [
                          OllieDropdownItem(
                            value: 'option1',
                            label: 'Option 1',
                          ),
                        ],
                        disabled: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Radio Buttons',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OllieRadioGroup<String>(
                        label: 'Select your plan',
                        options: const [
                          OllieRadioOption(
                            value: 'option1',
                            label: 'Free Plan',
                          ),
                          OllieRadioOption(value: 'option2', label: 'Pro Plan'),
                          OllieRadioOption(
                            value: 'option3',
                            label: 'Enterprise Plan',
                          ),
                        ],
                        value: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value ?? 'option1'),
                      ),
                      const SizedBox(height: 24),
                      OllieRadioGroup<String>(
                        label: 'Horizontal layout',
                        direction: Axis.horizontal,
                        options: const [
                          OllieRadioOption(value: 'yes', label: 'Yes'),
                          OllieRadioOption(value: 'no', label: 'No'),
                          OllieRadioOption(value: 'maybe', label: 'Maybe'),
                        ],
                        value: _radioValue,
                        onChanged: (value) =>
                            setState(() => _radioValue = value ?? 'yes'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Badges',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status badges',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: const [
                          OllieBadge(text: 'Primary'),
                          OllieBadge.success(text: 'Success'),
                          OllieBadge.warning(text: 'Warning'),
                          OllieBadge.danger(text: 'Danger'),
                          OllieBadge.info(text: 'Info'),
                          OllieBadge(text: '99+'),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Badges on widgets',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 24,
                        runSpacing: 12,
                        children: [
                          OllieBadgedWidget(
                            badge: const OllieBadge(text: '5'),
                            child: Icon(Icons.notifications_outlined, size: 32),
                          ),
                          OllieBadgedWidget(
                            badge: const OllieBadge.dot(),
                            child: Icon(Icons.mail_outline, size: 32),
                          ),
                          OllieBadgedWidget(
                            badge: const OllieBadge.danger(text: 'New'),
                            child: OllieButton(
                              text: 'Messages',
                              onPressed: () {},
                              width: 120,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildSection(
                  'Data Table',
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sortable data table with pagination and row selection',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      OllieDataTable<_TableRow>(
                        columns: const [
                          OllieDataColumn(
                            id: 'name',
                            label: 'Name',
                            flex: 2,
                            sortable: true,
                          ),
                          OllieDataColumn(
                            id: 'section',
                            label: 'Section Type',
                            flex: 2,
                            sortable: true,
                          ),
                          OllieDataColumn(
                            id: 'status',
                            label: 'Status',
                            flex: 2,
                            sortable: true,
                          ),
                          OllieDataColumn(
                            id: 'target',
                            label: 'Target',
                            flex: 1,
                            sortable: true,
                          ),
                          OllieDataColumn(
                            id: 'reviewer',
                            label: 'Reviewer',
                            flex: 2,
                            sortable: false,
                          ),
                        ],
                        rows: _getSampleTableData(),
                        showCheckboxes: true,
                        selectedRows: _selectedTableRows,
                        onSelectionChanged: (rows) =>
                            setState(() => _selectedTableRows = rows),
                        rowBuilder: (row, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      row.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade700,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        row.sectionType,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          row.status == 'Done'
                                              ? Icons.check_circle
                                              : Icons.pending,
                                          size: 16,
                                          color: row.status == 'Done'
                                              ? Colors.green
                                              : Colors.orange,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(row.status),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(row.target.toString()),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(row.reviewer),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<_TableRow> _getSampleTableData() {
    return [
      _TableRow('Cover page', 'Cover page', 'In Process', 18, 'Eddie Lake'),
      _TableRow(
        'Table of contents',
        'Table of contents',
        'Done',
        29,
        'Eddie Lake',
      ),
      _TableRow('Executive summary', 'Narrative', 'Done', 10, 'Eddie Lake'),
      _TableRow(
        'Technical approach',
        'Narrative',
        'Done',
        27,
        'Jamik Tashpulatov',
      ),
      _TableRow('Design', 'Narrative', 'In Process', 2, 'Jamik Tashpulatov'),
      _TableRow(
        'Capabilities',
        'Narrative',
        'In Process',
        20,
        'Jamik Tashpulatov',
      ),
      _TableRow(
        'Integration with existing systems',
        'Narrative',
        'In Process',
        19,
        'Jamik Tashpulatov',
      ),
      _TableRow(
        'Innovation and Advantages',
        'Narrative',
        'Done',
        25,
        'Assign reviewer',
      ),
      _TableRow(
        'Overview of EMR\'s Innovative Solutions',
        'Technical content',
        'Done',
        7,
        'Assign reviewer',
      ),
      _TableRow(
        'Advanced Algorithms and Machine Learning',
        'Narrative',
        'Done',
        30,
        'Assign reviewer',
      ),
      _TableRow(
        'Data Security and Privacy',
        'Technical content',
        'In Process',
        15,
        'Sarah Johnson',
      ),
      _TableRow(
        'Scalability and Performance',
        'Narrative',
        'Done',
        22,
        'Michael Chen',
      ),
      _TableRow(
        'User Experience Design',
        'Narrative',
        'In Process',
        12,
        'Emma Wilson',
      ),
      _TableRow(
        'API Documentation',
        'Technical content',
        'Done',
        18,
        'David Brown',
      ),
      _TableRow(
        'Testing Strategy',
        'Technical content',
        'In Process',
        14,
        'Lisa Anderson',
      ),
    ];
  }

  Widget _buildSection(String title, Widget content) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}

// Sample data class for the table
class _TableRow {
  final String name;
  final String sectionType;
  final String status;
  final int target;
  final String reviewer;

  _TableRow(
    this.name,
    this.sectionType,
    this.status,
    this.target,
    this.reviewer,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _TableRow &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          sectionType == other.sectionType &&
          status == other.status &&
          target == other.target &&
          reviewer == other.reviewer;

  @override
  int get hashCode =>
      name.hashCode ^
      sectionType.hashCode ^
      status.hashCode ^
      target.hashCode ^
      reviewer.hashCode;
}
