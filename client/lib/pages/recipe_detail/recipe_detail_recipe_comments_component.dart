import 'dart:io';
import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/models.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RecipeCommentsComponent extends StatefulWidget {
  const RecipeCommentsComponent({super.key, required this.recipe});

  final Recipe recipe;

  @override
  RecipeCommentsComponentState createState() => RecipeCommentsComponentState();
}

class RecipeCommentsComponentState extends State<RecipeCommentsComponent> {
  bool isTextFieldActive = false; // テキストフィールドがアクティブかどうか
  final myController = TextEditingController(); // コメント入力欄のコントローラー
  final FocusNode _focusNode = FocusNode(); // フォーカスを管理するためのFocusNode
  String comment = '';
  File? _selectedImage; // 選択された画像
  final ImagePicker _picker = ImagePicker(); // 画像選択用のImagePicker

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isTextFieldActive = _focusNode.hasFocus; // フォーカスがあるかどうかを判定
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

// 選択した画像の取得
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
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
              if (_selectedImage != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title:
                      const Text('写真を削除', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedImage = null;
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
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                sliver: SliverList(
                  delegate:
                      SliverChildListDelegate.fixed([_buildCommentList()]),
                ),
              ),
            ],
          ),
        ),
        _buildCommentInput(),
      ],
    );
  }

// コメント入力欄
  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.gray3),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: myController,
            focusNode: _focusNode,
            minLines: isTextFieldActive ? 3 : 1,
            maxLines: null,
            decoration: InputDecoration(
              suffixIcon: isTextFieldActive ? _buildImageButton() : null,
              hintText: 'コメントする...',
              hintStyle: context.textTheme.labelLarge?.copyWith(
                color: AppColors.gray3,
              ),
              filled: true,
              fillColor: AppColors.white,
              hoverColor: AppColors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.gray3),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.green1),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              isDense: true,
            ),
            cursorColor: AppColors.green1,
            style: context.textTheme.labelLarge?.copyWith(
              color: AppColors.gray1,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: isTextFieldActive ? 52 : 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    myController.clear();
                    _selectedImage = null;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.gray2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    fixedSize: const Size(100, 36),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'キャンセル',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.gray2,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                FilledButton(
                  onPressed: () {
                    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    // API繋ぎ込みで修正が必要　　コメントのデータ送信
                    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    comment = myController.text;
                    myController.clear();
                    _selectedImage = null;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green1,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    fixedSize: const Size(100, 36),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'コメント',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// コメント入力欄内の画像選択ボタン
  Widget _buildImageButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: _showImagePickerDialog,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.gray4,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.gray3),
            image: _selectedImage != null
                ? DecorationImage(
                    image: NetworkImage(
                      _selectedImage!.path,
                    ), // Web でも動作可能のため，NetworkImageを使用
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: _selectedImage == null
              ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera,
                      color: AppColors.gray2,
                      size: 24,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '写真をのせる',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.gray2,
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }

// コメントリスト
  Widget _buildCommentList() {
    final comments = widget.recipe.comments;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('コメント', '(${comments.length})', context),
        const SizedBox(height: 16),
        Column(
          children: comments.map((comment) {
            final datetime = DateFormat('yyyy/MM/dd').format(comment.updatedAt);
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.gray4),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          comment.imageUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    comment.user.name,
                                    style: context.textTheme.bodyMediumBold
                                        ?.copyWith(
                                      color: AppColors.gray1,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    datetime,
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: AppColors.gray2,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // TODO: ログイン処理が完了次第修正
                            if (comment.user.id == '12345') // ユーザーが自分自身かどうか判定
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: IconButton(
                                  icon: const Icon(Icons.more_horiz, size: 16),
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minWidth: 20,
                                    minHeight: 20,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                comment.contentText,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.gray1,
                                ),
                                softWrap: true,
                              ),
                            ),
                            if (comment.imageUrl == null) ...[
                              const SizedBox(width: 4),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.network(
                                    comment.imageUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 22),
              backgroundColor: AppColors.green3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
            onPressed: () {},
            child: Text(
              'もっと見る',
              style: context.textTheme.labelLargeBold?.copyWith(
                color: AppColors.gray1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//  タイトル
Widget _buildTitle(String title, String subtitle, BuildContext context) {
  return Stack(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: context.textTheme.titleLargeBold?.copyWith(
              color: AppColors.gray1,
            ),
          ),
          Text(
            subtitle,
            style: context.textTheme.titleMedium?.copyWith(
              color: AppColors.gray2,
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 1,
        left: 0,
        right: 0,
        child: Container(
          height: 5,
          color: AppColors.green1_50,
        ),
      ),
    ],
  );
}
