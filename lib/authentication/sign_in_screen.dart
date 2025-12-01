import 'package:flutter/material.dart';

import 'sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final widget = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.0,
        children: <Widget>[
          Text(
            'Sign in',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SignInForm(),
        ],
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 768) {
              return Center(
                child: SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Card(
                    child: widget,
                  ),
                ),
              );
            } else {
              return widget;
            }
          },
        ),
      ),
    );
  }
}
