import 'package:client/services/auth_service.dart';
import 'package:flutter/material.dart';

class SampleSignInView extends StatefulWidget {
  const SampleSignInView({super.key});

  @override
  State<SampleSignInView> createState() => _SampleSignInViewState();
}

class _SampleSignInViewState extends State<SampleSignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onPressedSignIn() async {
    await AuthService.instance.signInWithEmail(
      _emailController.text,
      _emailController.text,
    );
  }

  Future<void> _onPressedSignInWithGoogle() async {
    await AuthService.instance.signInWithGoogle();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedSignIn,
          child: const Text('ログイン'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedSignInWithGoogle,
          child: const Text('Googleでログイン'),
        ),
      ],
    );
  }
}
