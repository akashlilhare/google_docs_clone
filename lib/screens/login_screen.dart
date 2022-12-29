import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/repository/auth_repostiory.dart';

import 'package:routemaster/routemaster.dart';
class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void signInWithGoogle(WidgetRef ref, BuildContext context) async {

    final errorModel =
        await ref.read(authRepositoryProvider).signInWithGoogle();
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      Routemaster.of(context).replace('/');

    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorModel.error!)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => signInWithGoogle(ref, context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, minimumSize: Size(300, 50)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/g-logo-2.png",
                      height: 36,
                      width: 36,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    const Text(
                      "Continue with google",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
