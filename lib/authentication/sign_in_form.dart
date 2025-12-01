import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../home/home_route.dart';
import 'authentication_notifier.dart';
import 'client_id_form_field.dart';
import 'client_secret_form_field.dart';
import 'sign_in_button.dart';
import 'sign_up_button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() {
    return _SignInFormState();
  }
}

class _SignInFormState extends State<SignInForm> {
  final _clientIdController = TextEditingController();
  final _clientIdFocusNode = FocusNode();
  final _clientSecretController = TextEditingController();
  final _clientSecretFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 16.0,
        children: <Widget>[
          ClientIdFormField(
            controller: _clientIdController,
            focusNode: _clientIdFocusNode,
            onFieldSubmitted: (value) {
              _clientIdFocusNode.unfocus();

              _clientSecretFocusNode.requestFocus();
            },
          ),
          ClientSecretFormField(
            controller: _clientSecretController,
            focusNode: _clientSecretFocusNode,
            onFieldSubmitted: (value) {
              _clientSecretFocusNode.unfocus();

              _onSubmitted();
            },
          ),
          OverflowBar(
            spacing: 8.0,
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              const SignUpButton(),
              SignInButton(
                onPressed: _onSubmitted,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _clientIdController.dispose();
    _clientIdFocusNode.dispose();
    _clientSecretController.dispose();
    _clientSecretFocusNode.dispose();

    super.dispose();
  }

  Future<void> _onSubmitted() async {
    if (_formKey.currentState?.validate() == true) {
      final notifier = context.read<AuthenticationNotifier>();
      final router = GoRouter.of(context);

      final clientId = _clientIdController.text;
      final clientSecret = _clientSecretController.text;

      await notifier.signIn(clientId, clientSecret);

      router.go(const HomeRoute().location);
    }
  }
}
