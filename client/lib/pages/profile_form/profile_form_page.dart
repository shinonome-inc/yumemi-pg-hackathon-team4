import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileFormPage extends ConsumerStatefulWidget {
  const ProfileFormPage({super.key});

  @override
  ConsumerState createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends ConsumerState<ProfileFormPage> {
  bool _showLikedRecipe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
            onPressed: () {},
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
            spacing: 16,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: AppColors.gray1A80,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: AppColors.white,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '表示名',
                  labelStyle: context.textTheme.titleMediumBold,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  counterText: '10', // 文字数カウント (未実装)
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '自己紹介',
                  labelStyle: context.textTheme.titleMediumBold,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  counterText: '60',
                ),
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
