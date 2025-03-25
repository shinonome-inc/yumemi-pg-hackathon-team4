import 'package:client/constants/mock_data.dart';
import 'package:client/pages/sample/sample_notifier.dart';
import 'package:client/pages/sample/sample_recipe_view.dart';
import 'package:client/pages/sample/sample_sign_in_view.dart';
import 'package:client/pages/sample/sample_sign_up_view.dart';
import 'package:client/services/auth_service.dart';
import 'package:client/services/gemini_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SamplePage extends ConsumerStatefulWidget {
  const SamplePage({super.key});

  @override
  ConsumerState createState() => _SamplePageState();
}

class _SamplePageState extends ConsumerState<SamplePage> {
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
    final notifier = ref.read(sampleNotifierProvider.notifier);
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
                ExpansionTile(
                  title: const Text('Image Upload Sample'),
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: notifier.selectImage,
                          icon: const Icon(Icons.add_a_photo_outlined),
                        ),
                        Container(
                          width: 64,
                          height: 64,
                          color: Colors.grey,
                          child: state.selectedImage == null
                              ? const SizedBox.shrink()
                              : Image.file(
                                  state.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        if (state.selectedImage != null)
                          IconButton(
                            onPressed: notifier.uploadImage,
                            icon:
                                const Icon(Icons.drive_folder_upload_outlined),
                          ),
                      ],
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('AI Comment Sample'),
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        final inputText = '${recipes.first.toJson()}';
                        print('input text');
                        final comment =
                            await GeminiService.instance.generateMessage(
                          inputText: inputText,
                        );
                        print(comment);
                      },
                      child: const Text('コメントを生成'),
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
