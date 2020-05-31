import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final Function(bool) onChanged;
  final Color activeColor;
  const CustomCheckbox({this.value, this.onChanged, this.activeColor});
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _selectedValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value;
          widget.onChanged(value);
        });
      },
      activeColor: widget.activeColor,
    );
  }
}
