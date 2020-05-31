import 'package:flutter/material.dart';

class CustomDropDownField extends StatefulWidget {
  final List<DropdownMenuItem<int>> items;
  final ValueChanged valueChanged;
  final int selectedValue;
  final String title;
  final Function(int) validator;
  final void Function(int) onSaved;
  final bool isExpanded;
  final Icon prefixIcon;

  const CustomDropDownField(
      {Key key,
      this.prefixIcon,
      this.items,
      this.validator,
      this.valueChanged,
      this.selectedValue,
      this.title,
      this.onSaved,
      this.isExpanded})
      : super(key: key);

  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  int _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        isExpanded: widget.isExpanded ?? false,
        value: _selectedValue,
        validator: widget.validator,
        items: widget.items,
        onSaved: widget.onSaved,
        decoration: InputDecoration(
            labelText: widget.title, prefixIcon: widget.prefixIcon ?? null),
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
            widget.valueChanged(value);
          });
        });
  }
}

class DropDownItems {
  int id;
  String name;

  DropDownItems(this.id, this.name);
}
