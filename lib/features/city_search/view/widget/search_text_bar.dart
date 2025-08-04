import 'package:flutter/material.dart';

class SearchTextBar extends StatefulWidget {
  const SearchTextBar({
    this.initialValue,
    this.width = double.infinity,
    this.height = 34.0,
    this.elevation = 0.0,
    this.leading,
    this.trailing = const Icon(Icons.search),
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.resetOnSubmit = false,
    this.backgroundColor = Colors.white,
    super.key,
  });

  final String? initialValue;
  final double width;
  final double height;
  final double elevation;
  final Widget? leading;
  final Widget trailing;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool resetOnSubmit;
  final Color backgroundColor;

  @override
  State<SearchTextBar> createState() => _SearchTextBarState();
}

class _SearchTextBarState extends State<SearchTextBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _searchController.text = widget.initialValue!;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant SearchTextBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialValue != widget.initialValue) {
      _searchController.text = widget.initialValue ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: _searchController,
      leading: widget.leading,
      trailing: <Widget>[widget.trailing],
      hintText: widget.hintText,
      onChanged: widget.onChanged,
      onSubmitted: widget.resetOnSubmit
          ? (value) {
              widget.onSubmitted?.call(value);
              _searchController.clear();
            }
          : widget.onSubmitted,
      constraints: BoxConstraints(
        minWidth: widget.width,
        minHeight: widget.height,
      ),
      elevation: WidgetStatePropertyAll(widget.elevation),
      backgroundColor: WidgetStatePropertyAll(widget.backgroundColor),
    );
  }
}
