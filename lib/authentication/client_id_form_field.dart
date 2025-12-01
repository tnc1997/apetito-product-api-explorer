import 'package:flutter/material.dart';

class ClientIdFormField extends StatelessWidget {
  const ClientIdFormField({
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
        label: Text('Client ID'),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
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
