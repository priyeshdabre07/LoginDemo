import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  final String title;
  final bool enabled;
  final String initialValue;
  final bool autoValidate;
  final bool isDecimal;
  final TextEditingController controller;
  final Function(String) validator;
  final String errorText;
  final TextInputType inputType;
  final int maxLines;
  final int minLines;
  final List<TextInputFormatter> formatter;
  final bool obscure;
  final IconData prefixIcon;

  CustomTextField(
      {@required this.title,
      @required this.initialValue,
      this.prefixIcon,
      this.inputType,
      this.enabled,
      this.controller,
      this.errorText,
      this.autoValidate,
      this.validator,
      this.isDecimal,
      this.formatter,
      this.maxLines,
      this.minLines,
      this.onSaved,
      this.obscure});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: widget.obscure ?? false,
        enabled: widget.enabled ?? true,
        controller: widget.controller,
        validator: widget.validator,
        autovalidate: widget.autoValidate ?? false,
        onSaved: widget.onSaved,
        keyboardType: widget.inputType ?? TextInputType.text,
        decoration: InputDecoration(
            prefixIcon:
                widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
            errorStyle: TextStyle(color: Colors.red),
            labelText: widget.title,
            errorText: widget.errorText),
        initialValue: widget.initialValue,
        maxLines: widget.maxLines ?? 3,
        minLines: widget.minLines ?? 1,
        inputFormatters:
            widget.formatter ?? widget.inputType == TextInputType.number
                ? (widget.isDecimal == true)
                    ? []
                    : [WhitelistingTextInputFormatter.digitsOnly]
                : null,
      ),
    );
  }
}
