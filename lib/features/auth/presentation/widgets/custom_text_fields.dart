import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  CustomTextFields({
    super.key,
    required this.inputType,
    required this.controller,
    required this.validator,
    required this.labelText,
    this.isPasswordField =false,
    this.obscureText = false,

  });

  final String labelText;
  final TextInputType inputType;
  bool obscureText;
  TextEditingController controller;
  final FormFieldValidator validator;
  final bool isPasswordField;

  @override
  State<CustomTextFields> createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      keyboardType: widget.inputType,
      controller: widget.controller,
      validator: widget.validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: _toggleVisibility,
              )
            : null,
      ),
    );
  }
}
