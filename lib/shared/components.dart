import 'package:flutter/material.dart';

TextFormField defaultTextField({
  String? label,
  IconData? icon,
  String? hint,
  void Function(String value)? onChanged,
  bool hidePassword= false,
  String? Function(String? value)? validator,
  required TextEditingController? controller,
}) {
  return TextFormField(
    controller: controller,
    validator: validator,
    obscureText: hidePassword,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.yellow[700]!,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue[700]!,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
    ),
  );
}

MaterialButton myButton({
  String? title,
  Color? color,
  VoidCallback? onPress,
}) => MaterialButton(
      minWidth: double.infinity,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      color: color,
      child: Text(
        title!,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      onPressed: onPress,
    );
