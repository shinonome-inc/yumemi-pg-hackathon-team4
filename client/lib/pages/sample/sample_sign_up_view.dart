import 'package:client/services/auth_service.dart';
import 'package:flutter/material.dart';

class SampleSignUpView extends StatefulWidget {
  const SampleSignUpView({super.key});

  @override
  State<SampleSignUpView> createState() => _SampleSignUpViewState();
}

class _SampleSignUpViewState extends State<SampleSignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onPressedSignUp() async {
    await AuthService.instance.signUpWithEmail(
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
          onPressed: _onPressedSignUp,
          child: const Text('新規登録'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _onPressedSignInWithGoogle,
          child: const Text('Googleで新規登録'),
        ),
      ],
    );
  }
}
