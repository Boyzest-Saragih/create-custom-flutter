import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final String? judul;
  final bool isNumber;
  final ValueChanged? onChangedField;
  final bool isBorder;
  final Color? borderColor;
  final Color? fillColor;
  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hint = '',
    this.obscure = false,
    this.judul,
    this.isNumber = false,
    this.onChangedField,
    this.isBorder = true,
    this.borderColor,
    this.fillColor,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscure;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.judul != null && widget.judul!.isNotEmpty) ...[
            Text(
              widget.judul!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
          ],
          TextField(
            focusNode: widget.focusNode, 
            onChanged: widget.onChangedField,
            keyboardType:
                widget.isNumber ? TextInputType.number : TextInputType.text,
            controller: widget.controller,
            obscureText: _isObscured,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: widget.hint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
              filled: widget.fillColor != null,
              fillColor: widget.fillColor,
              border: widget.isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.grey,
                      ),
                    )
                  : InputBorder.none,
              focusedBorder: widget.isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color:
                            widget.borderColor ?? Theme.of(context).primaryColor,
                      ),
                    )
                  : InputBorder.none,
              enabledBorder: widget.isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.grey,
                      ),
                    )
                  : InputBorder.none,
              suffixIcon: widget.obscure
                  ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      );
}
