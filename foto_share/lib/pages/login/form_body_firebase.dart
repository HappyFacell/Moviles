import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import '../../utils/secrets.dart';
import '../home/home_page.dart';

class FormBodyFirebase extends StatelessWidget {
  const FormBodyFirebase({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      showAuthActionSwitch: false, // disable navigate to register screen
      headerBuilder: (context, constraints, breakpoint) {
        return Center(
          child: Image.asset("assets/icons/app_icon.png", height: 120),
        );
      },
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: GOOGLE_CLIENT_ID),
      ],
      footerBuilder: (context, action) {
        return const Text(
          'By signing in, you agree to our terms and conditions.',
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }),
      ],
    );
  }
}