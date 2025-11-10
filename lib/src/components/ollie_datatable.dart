import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern data table component with pagination and sorting
class OllieDataTable<T> extends StatefulWidget {
  final List<OllieDataColumn> columns;
  final List<T> rows;
  final Widget Function(T row, int index) rowBuilder;
  final bool showCheckboxes;
  final List<T> selectedRows;
  final ValueChanged<List<T>>? onSelectionChanged;
  final int rowsPerPage;
  final List<int> availableRowsPerPage;
  final bool showPagination;
  final Widget? emptyState;
  final bool isLoading;

  const OllieDataTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.rowBuilder,
    this.showCheckboxes = false,
    this.selectedRows = const [],
    this.onSelectionChanged,
    this.rowsPerPage = 10,
    this.availableRowsPerPage = const [10, 25, 50, 100],
    this.showPagination = true,
    this.emptyState,
    this.isLoading = false,
  });

  @override
  State<OllieDataTable<T>> createState() => _OllieDataTableState<T>();
}

class _OllieDataTableState<T> extends State<OllieDataTable<T>> {
  int _currentPage = 0;
  int _rowsPerPage = 10;
  String? _sortColumn;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    _rowsPerPage = widget.rowsPerPage;
  }

  int get _totalPages => (widget.rows.length / _rowsPerPage).ceil();
  int get _startIndex => _currentPage * _rowsPerPage;
  int get _endIndex =>
      (_startIndex + _rowsPerPage).clamp(0, widget.rows.length);

  List<T> get _currentPageRows {
    if (!widget.showPagination) return widget.rows;
    return widget.rows.sublist(_startIndex, _endIndex);
  }

  bool get _allSelected {
    if (widget.selectedRows.isEmpty || _currentPageRows.isEmpty) return false;
    return _currentPageRows.every((row) => widget.selectedRows.contains(row));
  }

  void _toggleSelectAll() {
    final newSelection = List<T>.from(widget.selectedRows);
    if (_allSelected) {
      // Deselect all on current page
      for (var row in _currentPageRows) {
        newSelection.remove(row);
      }
    } else {
      // Select all on current page
      for (var row in _currentPageRows) {
        if (!newSelection.contains(row)) {
          newSelection.add(row);
        }
      }
    }
    widget.onSelectionChanged?.call(newSelection);
  }

  void _toggleRowSelection(T row) {
    final newSelection = List<T>.from(widget.selectedRows);
    if (newSelection.contains(row)) {
      newSelection.remove(row);
    } else {
      newSelection.add(row);
    }
    widget.onSelectionChanged?.call(newSelection);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Table
        Container(
          decoration: BoxDecoration(
            color: isDark
                ? OllieThemeConstants.darkSurfaceContainerLow
                : OllieThemeConstants.lightSurface,
            borderRadius: BorderRadius.circular(
              OllieThemeConstants.borderRadiusMedium,
            ),
            border: Border.all(
              color: OllieThemeConstants.getBorderColor(brightness),
            ),
          ),
          child: Column(
            children: [
              // Header
              _buildHeader(context, brightness),
              // Rows
              if (widget.isLoading)
                _buildLoadingState()
              else if (widget.rows.isEmpty)
                _buildEmptyState()
              else
                ..._currentPageRows.asMap().entries.map((entry) {
                  final index = entry.key;
                  final row = entry.value;
                  return _buildRow(
                    context,
                    brightness,
                    row,
                    _startIndex + index,
                  );
                }),
            ],
          ),
        ),
        // Pagination
        if (widget.showPagination &&
            !widget.isLoading &&
            widget.rows.isNotEmpty)
          _buildPagination(context, brightness),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? OllieThemeConstants.darkSurfaceContainerHighest
            : OllieThemeConstants.lightSurfaceVariant,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(OllieThemeConstants.borderRadiusMedium),
          topRight: Radius.circular(OllieThemeConstants.borderRadiusMedium),
        ),
      ),
      child: Row(
        children: [
          if (widget.showCheckboxes)
            SizedBox(
              width: 60,
              child: Checkbox(
                value: _allSelected,
                onChanged: (_) => _toggleSelectAll(),
                tristate: widget.selectedRows.isNotEmpty && !_allSelected,
              ),
            ),
          ...widget.columns.map((column) {
            return Expanded(
              flex: column.flex,
              child: InkWell(
                onTap: column.sortable
                    ? () {
                        setState(() {
                          if (_sortColumn == column.id) {
                            _sortAscending = !_sortAscending;
                          } else {
                            _sortColumn = column.id;
                            _sortAscending = true;
                          }
                        });
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Text(
                        column.label,
                        style: TextStyle(
                          fontSize: OllieThemeConstants.fontSizeSmall,
                          fontWeight: OllieThemeConstants.fontWeightSemiBold,
                          color: OllieThemeConstants.getTextColor(brightness),
                        ),
                      ),
                      if (column.sortable) ...[
                        const SizedBox(width: 4),
                        Icon(
                          _sortColumn == column.id
                              ? (_sortAscending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward)
                              : Icons.unfold_more,
                          size: 16,
                          color: _sortColumn == column.id
                              ? OllieThemeConstants.getPrimaryColor(brightness)
                              : OllieThemeConstants.getSecondaryTextColor(
                                  brightness,
                                ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRow(
    BuildContext context,
    Brightness brightness,
    T row,
    int index,
  ) {
    final isDark = brightness == Brightness.dark;
    final isSelected = widget.selectedRows.contains(row);
    final isEven = index % 2 == 0;

    return InkWell(
      onTap: widget.showCheckboxes ? () => _toggleRowSelection(row) : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                    ? OllieThemeConstants.getPrimaryColor(
                        brightness,
                      ).withValues(alpha: 0.1)
                    : OllieThemeConstants.getPrimaryColor(
                        brightness,
                      ).withValues(alpha: 0.05))
              : (isEven
                    ? (isDark
                          ? OllieThemeConstants.darkSurface
                          : OllieThemeConstants.lightSurface)
                    : (isDark
                          ? OllieThemeConstants.darkSurfaceContainerLowest
                          : OllieThemeConstants.lightSurfaceContainerLowest)),
          border: Border(
            bottom: BorderSide(
              color: OllieThemeConstants.getBorderColor(
                brightness,
              ).withValues(alpha: 0.5),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            if (widget.showCheckboxes)
              SizedBox(
                width: 60,
                child: Checkbox(
                  value: isSelected,
                  onChanged: (_) => _toggleRowSelection(row),
                ),
              ),
            Expanded(child: widget.rowBuilder(row, index)),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: CircularProgressIndicator(
          color: OllieThemeConstants.getPrimaryColor(
            Theme.of(context).brightness,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child:
          widget.emptyState ??
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.inbox_outlined,
                  size: 48,
                  color: OllieThemeConstants.getSecondaryTextColor(
                    Theme.of(context).brightness,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'No data available',
                  style: TextStyle(
                    fontSize: OllieThemeConstants.fontSizeBody,
                    color: OllieThemeConstants.getSecondaryTextColor(
                      Theme.of(context).brightness,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildPagination(BuildContext context, Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Rows per page selector
          Row(
            children: [
              Text(
                'Rows per page:',
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeSmall,
                  color: OllieThemeConstants.getSecondaryTextColor(brightness),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: OllieThemeConstants.getBorderColor(brightness),
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: _rowsPerPage,
                    isDense: true,
                    style: TextStyle(
                      fontSize: OllieThemeConstants.fontSizeSmall,
                      color: OllieThemeConstants.getTextColor(brightness),
                    ),
                    dropdownColor: isDark
                        ? OllieThemeConstants.darkSurfaceContainerHigh
                        : OllieThemeConstants.lightSurface,
                    items: widget.availableRowsPerPage.map((value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _rowsPerPage = value;
                          _currentPage = 0; // Reset to first page
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '${widget.selectedRows.length} of ${widget.rows.length} row(s) selected.',
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeSmall,
                  color: OllieThemeConstants.getSecondaryTextColor(brightness),
                ),
              ),
            ],
          ),
          // Page navigation
          Row(
            children: [
              Text(
                'Page ${_currentPage + 1} of $_totalPages',
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeSmall,
                  color: OllieThemeConstants.getSecondaryTextColor(brightness),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_left),
                iconSize: 20,
                onPressed: _currentPage > 0
                    ? () => setState(() => _currentPage = 0)
                    : null,
                tooltip: 'First page',
              ),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                iconSize: 20,
                onPressed: _currentPage > 0
                    ? () => setState(() => _currentPage--)
                    : null,
                tooltip: 'Previous page',
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                iconSize: 20,
                onPressed: _currentPage < _totalPages - 1
                    ? () => setState(() => _currentPage++)
                    : null,
                tooltip: 'Next page',
              ),
              IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_right),
                iconSize: 20,
                onPressed: _currentPage < _totalPages - 1
                    ? () => setState(() => _currentPage = _totalPages - 1)
                    : null,
                tooltip: 'Last page',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Column definition for OllieDataTable
class OllieDataColumn {
  final String id;
  final String label;
  final int flex;
  final bool sortable;

  const OllieDataColumn({
    required this.id,
    required this.label,
    this.flex = 1,
    this.sortable = false,
  });
}
