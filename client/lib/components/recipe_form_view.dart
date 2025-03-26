import 'dart:io';

import 'package:client/components/recipe_form_steps_input_component.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/recipe.dart';
import 'package:client/pages/recipe_form/recipe_form_notifier.dart';
import 'package:client/pages/recipe_form/recipe_form_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RecipeFormView extends StatefulWidget {
  const RecipeFormView({
    super.key,
    this.recipe,
    this.onSubmit,
    this.state,
    this.notifier,
  });

  final Recipe? recipe;
  final void Function(
    String title,
    String description,
    List<Map<String, String>> ingredients,
    List<RecipeStep> gatheringSteps,
    List<RecipeStep> cookingSteps,
    String tips,
    String? imageUrl,
  )? onSubmit;
  final RecipeFormState? state;
  final RecipeFormNotifier? notifier;

  @override
  State<RecipeFormView> createState() => _RecipeFormViewState();
}

class RecipeStep {
  RecipeStep({
    required this.description,
    this.image,
  });

  String description;
  File? image;
}

class _RecipeFormViewState extends State<RecipeFormView> {
  late List<Map<String, String>> _ingredients = [
    {'ingredientName': '', 'quantity': ''},
  ];
  late List<RecipeStep> _gatheringSteps = [RecipeStep(description: '')];
  late List<RecipeStep> _cookingSteps = [RecipeStep(description: '')];
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tipsController = TextEditingController();
  // final _reviewController = TextEditingController();
  late List<TextEditingController> _ingredientNameControllers = [
    TextEditingController(),
  ];
  late List<TextEditingController> _quantityControllers = [
    TextEditingController(),
  ];

  // Formのキーを追加
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.recipe != null) {
      setState(() {
        _titleController.text = widget.recipe!.title;
        _descriptionController.text = widget.recipe!.description;
        _tipsController.text = widget.recipe!.tips;

        _ingredients = widget.recipe!.ingredients.map((e) {
          return {'ingredientName': e.ingredientName, 'quantity': e.quantity};
        }).toList();

        _ingredientNameControllers = _ingredients
            .map(
              (ingredient) =>
                  TextEditingController(text: ingredient['ingredientName']),
            )
            .toList();

        _quantityControllers = _ingredients
            .map(
              (ingredient) =>
                  TextEditingController(text: ingredient['quantity']),
            )
            .toList();

        _gatheringSteps = widget.recipe!.gatheringSteps.map((e) {
          return RecipeStep(
            description: e.description,
          );
        }).toList();

        _cookingSteps = widget.recipe!.cookingSteps.map((e) {
          return RecipeStep(
            description: e.description,
          );
        }).toList();
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
                  context.pop();
                  widget.notifier?.selectImage(source: ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('写真を撮る'),
                onTap: () {
                  context.pop();
                  widget.notifier?.selectImage(source: ImageSource.camera);
                },
              ),
              if (widget.state?.selectedImage != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title:
                      const Text('写真を削除', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    context.pop();
                    widget.notifier?.clearImage();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _submitRecipe() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;
      final tips = _tipsController.text;
      const imageUrl = '';

      widget.onSubmit!(
        title,
        description,
        _ingredients,
        _gatheringSteps,
        _cookingSteps,
        tips,
        imageUrl,
      );
    }
  }

  @override
  void dispose() {
    for (final controller in _ingredientNameControllers) {
      controller.dispose();
    }
    for (final controller in _quantityControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      child: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: Form(
            key: _formKey,
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
                        image: widget.state?.selectedImage != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  widget.state!.selectedImage!.path,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: widget.state?.selectedImage == null
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
                          TextFormField(
                            controller: _titleController,
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
                            // validatorを追加
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '入力してください'; // エラーメッセージを簡潔に
                              }
                              return null;
                            },
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
                          TextFormField(
                            controller: _descriptionController,
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
                            // validatorを追加
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '入力してください'; // エラーメッセージを簡潔に
                              }
                              return null;
                            },
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
                                        controller:
                                            _ingredientNameControllers[index],
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
                                        onChanged: (value) =>
                                            _ingredients[index]
                                                ['ingredientName'] = value,
                                      ),
                                    ),
                                    Flexible(
                                      child: TextField(
                                        controller: _quantityControllers[index],
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
                                        onChanged: (value) =>
                                            _ingredients[index]['quantity'] =
                                                value,
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
                                  _ingredients.add(
                                    {'ingredientName': '', 'quantity': ''},
                                  );
                                  _ingredientNameControllers
                                      .add(TextEditingController());
                                  _quantityControllers
                                      .add(TextEditingController());
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
                            controller: _tipsController,
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
                    onPressed: _submitRecipe,
                    child: widget.recipe != null
                        ? const Text('レシピを更新する')
                        : const Text('レシピを公開する'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
