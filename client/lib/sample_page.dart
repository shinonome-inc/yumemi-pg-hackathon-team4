import 'package:firebase_auth/firebase_auth.dart';
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
    try {
      (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _onPressedSignIn() async {
    print('Start Sign In: ${FirebaseAuth.instance.currentUser}');
    try {
      (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
    } catch (e) {
      throw Exception(e);
    }
    print('Sign In Success: ${FirebaseAuth.instance.currentUser}');
  }

  Future<void> _onPressedSignOut() async {
    print('Start Sign Out: ${FirebaseAuth.instance.currentUser}');
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e);
    }
    print('Sign Out Success: ${FirebaseAuth.instance.currentUser}');
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
    );
  }
}
