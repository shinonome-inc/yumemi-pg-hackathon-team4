import 'dart:io';

import 'package:client/components/recipe_form_view.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum StepType { gathering, cooking }

class StepsItem extends StatefulWidget {
  const StepsItem({
    super.key,
    required this.stepType,
    required this.stepList,
  });

  final StepType stepType;
  final List<RecipeStep> stepList;

  @override
  State<StepsItem> createState() => _StepsItemState();
}

class _StepsItemState extends State<StepsItem> {
  late List<RecipeStep> stepList;
  final ImagePicker _picker = ImagePicker(); // 画像選択用のImagePicker
  late List<TextEditingController> _descriptionController = [
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    stepList = widget.stepList;
    _descriptionController = stepList
        .map(
          (item) => TextEditingController(text: item.description),
        )
        .toList();
  }

  // 選択した画像の取得
  Future<void> _pickImage(int index, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        stepList[index].image = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog(int index) {
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
                  _pickImage(index, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('写真を撮る'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(index, ImageSource.camera);
                },
              ),
              if (stepList[index].image != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title:
                      const Text('写真を削除', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      stepList[index].image = null;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          widget.stepType == StepType.gathering ? '採集方法' : '作り方',
          style: context.textTheme.titleMediumBold,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: stepList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 4,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.gray3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.green1,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: context.textTheme.labelSmall?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: TextField(
                      controller: _descriptionController[index],
                      minLines: 2,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: widget.stepType == StepType.gathering
                            ? '岩の隙間に隠れていることが多いので、そっと手を入れて探る。'
                            : 'フライパンに油を熱し、□□を中火で3分ほど炒める。',
                        hintStyle: context.textTheme.titleMedium?.copyWith(
                          color: AppColors.gray3,
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) => setState(() {
                        stepList[index].description = value;
                      }),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showImagePickerDialog(index),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.gray4,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.gray3),
                        image: stepList[index].image != null
                            ? DecorationImage(
                                image: NetworkImage(
                                  stepList[index].image!.path,
                                ), // Web でも動作可能のため，NetworkImageを使用
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: stepList[index].image == null
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo_camera,
                                  color: AppColors.gray2,
                                  size: 24,
                                ),
                              ],
                            )
                          : null,
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
                stepList.add(RecipeStep(description: ''));
                _descriptionController.add(TextEditingController());
              });
            },
            icon: const Icon(
              Icons.add,
            ),
            label: Text(
              widget.stepType == StepType.gathering ? '採集方法を追加' : '作り方を追加',
            ),
          ),
        ),
      ],
    );
  }
}
