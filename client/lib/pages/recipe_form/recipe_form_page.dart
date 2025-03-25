import 'dart:io';

import 'package:client/constants/app_colors.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/recipe_form/recipe_form_steps_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RecipeFormPage extends ConsumerStatefulWidget {
  const RecipeFormPage({super.key});

  @override
  ConsumerState createState() => _RecipeFormPageState();
}

class RecipeStep {
  RecipeStep({
    required this.text,
    this.image,
  });

  final String text;
  File? image;
}

class _RecipeFormPageState extends ConsumerState<RecipeFormPage> {
  final List<Map<String, String>> _ingredients = [
    {'name': '', 'amount': ''},
  ];

  File? _thumbnailImage;

  final List<RecipeStep> _gatheringSteps = [RecipeStep(text: '')];
  final List<RecipeStep> _cookingSteps = [RecipeStep(text: '')];
  final ImagePicker _picker = ImagePicker(); // 画像選択用のImagePicker

  // 選択した画像の取得
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _thumbnailImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Container(
          color: AppColors.white,
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('アルバムから選択'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('写真を撮る'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              if (_thumbnailImage != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title:
                      const Text('写真を削除', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _thumbnailImage = null;
                    });
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.close),
        ),
        title: Text(
          'レシピを書く',
          style: context.textTheme.titleMediumBold,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
          child: Container(
            alignment: Alignment.topCenter,
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                spacing: 32,
                children: [
                  GestureDetector(
                    onTap: _showImagePickerDialog,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.gray4,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.gray3),
                          image: _thumbnailImage != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    _thumbnailImage!.path,
                                  ), // Web でも動作可能のため，NetworkImageを使用
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _thumbnailImage == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.photo_camera,
                                    color: AppColors.gray2,
                                    size: 64,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '料理の写真をのせる',
                                    style: context.textTheme.titleMediumBold,
                                  ),
                                ],
                              )
                            : null,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'タイトル',
                              style: context.textTheme.titleSmallBold,
                            ),
                            TextField(
                              maxLength: 20,
                              decoration: InputDecoration(
                                hintText: 'カメノテお味噌汁',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'レシピの紹介文',
                              style: context.textTheme.titleSmallBold,
                            ),
                            TextField(
                              maxLength: 100,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'カメノテが落ちていたので，作ってみました！！♫♫♫',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              '材料',
                              style: context.textTheme.titleMediumBold,
                            ),
                            Container(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '2人分',
                                  hintStyle:
                                      context.textTheme.titleSmall?.copyWith(
                                    color: AppColors.gray3,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppColors.gray3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _ingredients.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    spacing: 8,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: '材料',
                                            hintStyle: context
                                                .textTheme.titleSmall
                                                ?.copyWith(
                                              color: AppColors.gray3,
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.gray3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            hintText: '分量',
                                            hintStyle: context
                                                .textTheme.titleSmall
                                                ?.copyWith(
                                              color: AppColors.gray3,
                                            ),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: AppColors.gray3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 40,
                              alignment: Alignment.center,
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _ingredients
                                        .add({'name': '', 'amount': ''});
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                ),
                                label: const Text(
                                  '材料を追加',
                                ),
                              ),
                            ),
                          ],
                        ),
                        // 採集方法
                        StepsItem(
                          stepType: StepType.gathering,
                          stepList: _gatheringSteps,
                        ),
                        // 作り方
                        StepsItem(
                          stepType: StepType.cooking,
                          stepList: _cookingSteps,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'コツ',
                              style: context.textTheme.titleMediumBold,
                            ),
                            TextField(
                              maxLength: 60,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'この料理のアイデアや、おいしく作るコツ',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '食レポ',
                              style: context.textTheme.titleMediumBold,
                            ),
                            TextField(
                              maxLength: 60,
                              minLines: 2,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: '使ったワイルドフードの味、食感、何に似ているか',
                                hintStyle:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: AppColors.gray3,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.gray3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: FilledButton(
                      onPressed: () {
                        context.go(AppPage.recipeList.path);
                      },
                      child: const Text('レシピを公開する'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
