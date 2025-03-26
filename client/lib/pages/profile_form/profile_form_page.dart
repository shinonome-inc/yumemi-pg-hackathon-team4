import 'package:client/components/network_error_view.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/constants/image_urls.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/profile_form/profile_form_notifier.dart';
import 'package:client/providers/signed_in_user_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileFormPage extends ConsumerStatefulWidget {
  const ProfileFormPage({super.key});

  @override
  ConsumerState createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends ConsumerState<ProfileFormPage> {
  bool _showLikedRecipe = false;

  final _nameController = TextEditingController();
  final _profileDescriptionController = TextEditingController();

  Future<void> _onTapSave() async {
    final user = ref.read(signedInUserNotifierProvider);
    await ref.read(profileFormNotifierProvider.notifier).sendProfile(
          authenticatedUser: user!,
          userName: _nameController.text,
          userProfileDescription: _profileDescriptionController.text,
        );
    context.go(AppPage.currentUser.path);
  }

  @override
  void initState() {
    super.initState();
    Future(() {
      final signedInUser = ref.watch(signedInUserNotifierProvider);
      _nameController.text = signedInUser?.name ?? '';
      _profileDescriptionController.text =
          signedInUser?.profileDescription ?? '';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _profileDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileFormNotifierProvider);
    final notifier = ref.read(profileFormNotifierProvider.notifier);
    final signedInUser = ref.watch(signedInUserNotifierProvider);
    if (signedInUser == null) {
      // TODO: 専用のエラー画面を用意する（優先度・低）。
      return const NetworkError();
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        ),
        backgroundColor: AppColors.white,
        title: Text(
          'プロフィール編集',
          style: context.textTheme.titleSmallBold,
        ),
        actions: [
          TextButton(
            onPressed: _onTapSave,
            child: Text(
              '保存',
              style: context.textTheme.labelMediumBold?.copyWith(
                color: AppColors.green1,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            spacing: 12,
            children: [
              GestureDetector(
                onTap: notifier.selectImage,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: state.selectedImage == null
                          ? signedInUser.imageUrl == null
                              ? const NetworkImage(ImageUrls.defaultUserIcon)
                              : NetworkImage(signedInUser.imageUrl!)
                          : FileImage(state.selectedImage!),
                    ),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    size: 20,
                    color: AppColors.gray1,
                  ),
                ),
              ),
              TextField(
                controller: _nameController,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: '名前',
                  labelStyle: context.textTheme.titleMediumBold,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: _profileDescriptionController,
                maxLength: 100,
                keyboardType: TextInputType.multiline,
                minLines: 2,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: '自己紹介',
                  labelStyle: context.textTheme.titleMediumBold,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'いいねしたレシピをプロフィールに表示',
                  style: context.textTheme.labelLargeBold,
                ),
                value: _showLikedRecipe,
                onChanged: (newValue) {
                  setState(() {
                    _showLikedRecipe = !_showLikedRecipe;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
