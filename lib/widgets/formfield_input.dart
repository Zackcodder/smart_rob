import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_rob/core/constants/text_style.dart';

class FormFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final Color borderColor;
  final Widget? suffixIcon;
  final double height;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const FormFieldWidget({
    super.key,
    this.controller,
      this.suffixIcon,
    required this.labelText,
    this.keyboardType,
    this.obscureText = false, // Useful for passwords
    this.hintText = '',
    this.borderColor = Colors.grey,
    this.height = 41,
    this.inputFormatters,
    this.validator,
  });

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.labelText),
          SizedBox(height: 5),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: widget.borderColor),
            ),
            child: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              controller: widget.controller,
              inputFormatters: widget.inputFormatters,
              validator: widget.validator,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: ktsTextFieldHint,
            suffixIcon: widget.suffixIcon,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
