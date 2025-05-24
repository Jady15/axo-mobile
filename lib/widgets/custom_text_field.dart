import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key, 
    required this.label, 
    this.isPassword = false, 
    required this.controller, 
    this.validator,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

  class _CustomTextFieldState extends State<CustomTextField> {
    late bool _obscureText;

    @override
    void initState() {
      super.initState();
      _obscureText = widget.isPassword;
    }

    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword ? _obscureText : false,
        style: TextStyle(fontSize:18),
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.isPassword
            ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color:Color.fromRGBO(13, 73, 139, 1),
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ) : null,
        ),
        validator: widget.validator,
      )
    );
  }
}
