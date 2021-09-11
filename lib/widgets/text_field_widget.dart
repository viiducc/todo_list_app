import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  const TextFieldWidget(
      {Key? key,
      required this.label,
      required this.controller,
      required this.obscure})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !widget.obscure ? false : _isObscure,
      controller: widget.controller,
      style: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: Color(0xFF313131),
      ),
      decoration: InputDecoration(
        hintText: widget.label,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xFFC6C6C6),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  _isObscure
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: const Color(0xFFB5BBC9),
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            : Container(
                width: 1,
              ),
      ),
    );
  }
}
