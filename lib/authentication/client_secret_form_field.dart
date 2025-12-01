import 'package:flutter/material.dart';

class ClientSecretFormField extends StatelessWidget {
  const ClientSecretFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final void Function(String value)? onFieldSubmitted;

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        label: Text('Client secret'),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      onFieldSubmitted: onFieldSubmitted,
      validator: (value) {
        if (value?.isEmpty != false) {
          return 'Please enter a value.';
        }

        return null;
      },
    );
  }
}
