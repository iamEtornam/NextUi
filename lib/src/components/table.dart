import 'package:flutter/material.dart';
import 'package:next_ui/src/index.dart';

/// Sort descriptor for table sorting
class TableSortDescriptor {
  /// Creates a sort descriptor
  const TableSortDescriptor({
    required this.columnKey,
    required this.ascending,
  });

  /// Column key to sort by
  final String columnKey;

  /// Whether to sort ascending
  final bool ascending;
}

/// Column definition for table
class TableColumnDef<T> {
  /// Creates a column definition
  const TableColumnDef({
    required this.key,
    required this.label,
    this.align = TableColumnAlign.start,
    this.width,
    this.minWidth,
    this.maxWidth,
    this.allowsSorting = false,
    this.sortIcon,
    this.builder,
  });

  /// Unique key for the column
  final String key;

  /// Column label
  final String label;

  /// Column alignment
  final TableColumnAlign align;

  /// Fixed width
  final double? width;

  /// Minimum width
  final double? minWidth;

  /// Maximum width
  final double? maxWidth;

  /// Whether column supports sorting
  final bool allowsSorting;

  /// Custom sort icon
  final Widget? sortIcon;

  /// Custom cell builder
  final Widget Function(T item)? builder;
}

/// Next UI Table component
///
/// Tables are used to display tabular data using rows and columns.
/// Following HeroUI design patterns with comprehensive customization options.
class NextTable<T> extends StatefulWidget {
  /// Creates a table
  const NextTable({
    required this.columns,
    required this.rows,
    super.key,
    this.selectionMode = TableSelectionMode.none,
    this.selectionBehavior = TableSelectionBehavior.toggle,
    this.selectedKeys = const {},
    this.disabledKeys = const {},
    this.disallowEmptySelection = false,
    this.isStriped = false,
    this.isCompact = false,
    this.isHeaderSticky = false,
    this.hideHeader = false,
    this.removeWrapper = false,
    this.fullWidth = true,
    this.sortDescriptor,
    this.emptyContent,
    this.topContent,
    this.bottomContent,
    this.topContentPlacement = TableContentPlacement.inside,
    this.bottomContentPlacement = TableContentPlacement.inside,
    this.onSelectionChange,
    this.onSortChange,
    this.onRowAction,
  });

  /// Column definitions
  final List<TableColumnDef<T>> columns;

  /// Table data rows
  final List<T> rows;

  /// Selection mode
  final TableSelectionMode selectionMode;

  /// Selection behavior
  final TableSelectionBehavior selectionBehavior;

  /// Selected row keys
  final Set<String> selectedKeys;

  /// Disabled row keys
  final Set<String> disabledKeys;

  /// Whether to disallow empty selection
  final bool disallowEmptySelection;

  /// Whether to show striped rows
  final bool isStriped;

  /// Whether to use compact spacing
  final bool isCompact;

  /// Whether header is sticky
  final bool isHeaderSticky;

  /// Whether to hide header
  final bool hideHeader;

  /// Whether to remove wrapper
  final bool removeWrapper;

  /// Whether table takes full width
  final bool fullWidth;

  /// Current sort descriptor
  final TableSortDescriptor? sortDescriptor;

  /// Content shown when table is empty
  final Widget? emptyContent;

  /// Content shown above table
  final Widget? topContent;

  /// Content shown below table
  final Widget? bottomContent;

  /// Top content placement
  final TableContentPlacement topContentPlacement;

  /// Bottom content placement
  final TableContentPlacement bottomContentPlacement;

  /// Called when selection changes
  final ValueChanged<Set<String>>? onSelectionChange;

  /// Called when sort changes
  final ValueChanged<TableSortDescriptor>? onSortChange;

  /// Called when row is actioned
  final ValueChanged<T>? onRowAction;

  @override
  State<NextTable<T>> createState() => _NextTableState<T>();
}

class _NextTableState<T> extends State<NextTable<T>> {
  late Set<String> _selectedKeys;

  @override
  void initState() {
    super.initState();
    _selectedKeys = Set.from(widget.selectedKeys);
  }

  @override
  void didUpdateWidget(NextTable<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedKeys != oldWidget.selectedKeys) {
      _selectedKeys = Set.from(widget.selectedKeys);
    }
  }

  String _getRowKey(T item) {
    return item.hashCode.toString();
  }

  void _handleRowTap(T item) {
    final key = _getRowKey(item);

    if (widget.disabledKeys.contains(key)) return;

    if (widget.selectionMode == TableSelectionMode.none) {
      widget.onRowAction?.call(item);
      return;
    }

    setState(() {
      if (widget.selectionMode == TableSelectionMode.single) {
        if (_selectedKeys.contains(key) && !widget.disallowEmptySelection) {
          _selectedKeys.clear();
        } else {
          _selectedKeys = {key};
        }
      } else if (widget.selectionMode == TableSelectionMode.multiple) {
        if (_selectedKeys.contains(key)) {
          if (!widget.disallowEmptySelection || _selectedKeys.length > 1) {
            _selectedKeys.remove(key);
          }
        } else {
          _selectedKeys.add(key);
        }
      }
    });

    widget.onSelectionChange?.call(_selectedKeys);
  }

  void _handleSort(String columnKey) {
    final currentSort = widget.sortDescriptor;
    final ascending =
        currentSort?.columnKey != columnKey || !currentSort!.ascending;

    widget.onSortChange?.call(
      TableSortDescriptor(
        columnKey: columnKey,
        ascending: ascending,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.rows.isEmpty && widget.emptyContent != null) {
      return _buildEmptyState();
    }

    final table = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.topContent != null &&
            widget.topContentPlacement == TableContentPlacement.inside)
          widget.topContent!,
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth:
                    widget.fullWidth ? MediaQuery.of(context).size.width : 0,
              ),
              child: _buildTable(context),
            ),
          ),
        ),
        if (widget.bottomContent != null &&
            widget.bottomContentPlacement == TableContentPlacement.inside)
          widget.bottomContent!,
      ],
    );

    if (widget.removeWrapper) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.topContent != null &&
              widget.topContentPlacement == TableContentPlacement.outside)
            widget.topContent!,
          Flexible(child: table),
          if (widget.bottomContent != null &&
              widget.bottomContentPlacement == TableContentPlacement.outside)
            widget.bottomContent!,
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.topContent != null &&
            widget.topContentPlacement == TableContentPlacement.outside)
          widget.topContent!,
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withValues(alpha: 0.12),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: table,
            ),
          ),
        ),
        if (widget.bottomContent != null &&
            widget.bottomContentPlacement == TableContentPlacement.outside)
          widget.bottomContent!,
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: widget.emptyContent ??
            const Text(
              'No data available',
              style: TextStyle(color: Colors.grey),
            ),
      ),
    );
  }

  Widget _buildTable(BuildContext context) {
    final theme = Theme.of(context);

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: _buildColumnWidths(),
      children: [
        if (!widget.hideHeader) _buildHeader(theme),
        ..._buildRows(theme),
      ],
    );
  }

  Map<int, TableColumnWidth> _buildColumnWidths() {
    final widths = <int, TableColumnWidth>{};

    for (var i = 0; i < widget.columns.length; i++) {
      final column = widget.columns[i];
      if (column.width != null) {
        widths[i] = FixedColumnWidth(column.width!);
      } else {
        widths[i] = const FlexColumnWidth();
      }
    }

    return widths;
  }

  TableRow _buildHeader(ThemeData theme) {
    return TableRow(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
      ),
      children: widget.columns.map((column) {
        final isSorted = widget.sortDescriptor?.columnKey == column.key;
        final isAscending = widget.sortDescriptor?.ascending ?? true;

        return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: InkWell(
            onTap: column.allowsSorting ? () => _handleSort(column.key) : null,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.isCompact ? 8 : 12,
                vertical: widget.isCompact ? 8 : 12,
              ),
              alignment: _getAlignment(column.align),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      column.label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  ),
                  if (column.allowsSorting) ...[
                    const SizedBox(width: 4),
                    Icon(
                      isSorted
                          ? (isAscending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward)
                          : Icons.unfold_more,
                      size: 16,
                      color: isSorted
                          ? theme.colorScheme.primary
                          : theme.textTheme.bodySmall?.color
                              ?.withValues(alpha: 0.5),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  List<TableRow> _buildRows(ThemeData theme) {
    return widget.rows.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final key = _getRowKey(item);
      final isSelected = _selectedKeys.contains(key);
      final isDisabled = widget.disabledKeys.contains(key);

      return TableRow(
        decoration: BoxDecoration(
          color: _getRowColor(theme, index, isSelected),
        ),
        children: widget.columns.map((column) {
          return TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: InkWell(
              onTap: isDisabled ? null : () => _handleRowTap(item),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isCompact ? 8 : 12,
                  vertical: widget.isCompact ? 8 : 12,
                ),
                alignment: _getAlignment(column.align),
                child: DefaultTextStyle(
                  style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDisabled
                            ? theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.4)
                            : theme.textTheme.bodyMedium?.color,
                      ) ??
                      const TextStyle(),
                  child: column.builder != null
                      ? column.builder!(item)
                      : _getDefaultCell(item, column.key),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }

  Widget _getDefaultCell(T item, String columnKey) {
    // Try to get value using reflection-like approach
    // This is a simplified version - in production you'd use better data access
    return Text(item.toString());
  }

  Color? _getRowColor(ThemeData theme, int index, bool isSelected) {
    if (isSelected) {
      return theme.colorScheme.primary.withValues(alpha: 0.1);
    }

    if (widget.isStriped && index.isOdd) {
      return theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.05);
    }

    return null;
  }

  Alignment _getAlignment(TableColumnAlign align) {
    switch (align) {
      case TableColumnAlign.start:
        return Alignment.centerLeft;
      case TableColumnAlign.center:
        return Alignment.center;
      case TableColumnAlign.end:
        return Alignment.centerRight;
    }
  }
}

/// Table header component (for API compatibility)
class NextTableHeader extends StatelessWidget {
  /// Creates a table header
  const NextTableHeader({
    required this.children,
    super.key,
  });

  /// Column widgets
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Table column component (for API compatibility)
class NextTableColumn extends StatelessWidget {
  /// Creates a table column
  const NextTableColumn({
    required this.children,
    super.key,
    this.align = TableColumnAlign.start,
    this.allowsSorting = false,
    this.width,
  });

  /// Column content
  final Widget children;

  /// Column alignment
  final TableColumnAlign align;

  /// Whether sorting is allowed
  final bool allowsSorting;

  /// Column width
  final double? width;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Table body component (for API compatibility)
class NextTableBody extends StatelessWidget {
  /// Creates a table body
  const NextTableBody({
    required this.children,
    super.key,
    this.emptyContent,
  });

  /// Row widgets
  final List<Widget> children;

  /// Empty state content
  final Widget? emptyContent;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Table row component (for API compatibility)
class NextTableRow extends StatelessWidget {
  /// Creates a table row
  const NextTableRow({
    required this.children,
    super.key,
  });

  /// Cell widgets
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

/// Table cell component (for API compatibility)
class NextTableCell extends StatelessWidget {
  /// Creates a table cell
  const NextTableCell({
    required this.children,
    super.key,
  });

  /// Cell content
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
