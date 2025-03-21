import 'package:client/pages/sample/sample_notifier.dart';
import 'package:client/pages/sample/sample_recipe_view.dart';
import 'package:client/pages/sample/sample_sign_in_view.dart';
import 'package:client/pages/sample/sample_sign_up_view.dart';
import 'package:client/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SamplePage extends ConsumerStatefulWidget {
  const SamplePage({super.key});

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<SamplePage> {
  Future<void> _onPressedSignOut() async {
    await AuthService.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(sampleNotifierProvider.notifier).fetchRecipesAndUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sampleNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('サンプル画面'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                const ExpansionTile(
                  title: Text('Sign Up Sample'),
                  children: <Widget>[
                    SampleSignUpView(),
                  ],
                ),
                const ExpansionTile(
                  title: Text('Sign In Sample'),
                  children: <Widget>[
                    SampleSignInView(),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Sign Out Sample'),
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _onPressedSignOut,
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Recipe Sample'),
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 32),
                      child: SampleRecipeView(state: state),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('User Sample'),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        final user = state.users.elementAt(index);
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text('@${user.id}'),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
