import 'package:client/services/auth_service.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _onPressedSignUp() async {
    await AuthService.instance.signUpWithEmail(
      _emailController.text,
      _emailController.text,
    );
  }

  Future<void> _onPressedSignIn() async {
    await AuthService.instance.signInWithEmail(
      _emailController.text,
      _emailController.text,
    );
  }

  Future<void> _signInWithGoogle() async {
    await AuthService.instance.signInWithGoogle();
  }

  Future<void> _onPressedSignOut() async {
    await AuthService.instance.signOut();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Page'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                const Text('Sign Up Sample'),
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
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 64),
                const Text('Sign In Sample'),
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
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _signInWithGoogle,
                  child: const Text('Sign In with Google'),
                ),
                const SizedBox(height: 64),
                const Text('Sign Up Sample'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onPressedSignOut,
                  child: const Text('Sign Out'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
