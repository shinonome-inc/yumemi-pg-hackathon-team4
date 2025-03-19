import 'dart:io';
import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

class RecipeCommentsComponent extends StatefulWidget {
  const RecipeCommentsComponent({super.key});

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
        isTextFieldActive = _focusNode.hasFocus;
        // print(isTextFieldActive);
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
        // print("pickedFile.name:${pickedFile.name}"); //元のファイル名
        // final uuid = const Uuid().v4();
        // final extension = pickedFile.name.split('.').last;
        // final fileName = '$uuid.$extension'; // ファイル名をUUIDに変更し，拡張子を下のファイルから取得.
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: AppColors.white, // 背景色を指定
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
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate.fixed([_buildComment()]),
          ),
        ),
      ],
    );
  }

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
                    image: NetworkImage(_selectedImage!.path), // ✅ Web でも動作可能
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

  Widget _buildComment() {
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // API繋ぎ込みで修正が必要 (コメントのデータ取得)
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    final comments = [
      {
        'userID': '12345',
        'username': '自分の投稿 (写真あり)',
        'datetime': '2024/03/18 12:00',
        'content': 'これは自分の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真なし)',
        'datetime': '2024/03/18 12:30',
        'content': 'これは自分の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真あり)',
        'datetime': '2024/03/18 13:00',
        'content': 'これは他人の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真なし)',
        'datetime': '2024/03/18 14:00',
        'content': 'これは他人の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真あり)',
        'datetime': '2024/03/18 12:00',
        'content': 'これは自分の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真なし)',
        'datetime': '2024/03/18 12:30',
        'content': 'これは自分の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真あり)',
        'datetime': '2024/03/18 13:00',
        'content': 'これは他人の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真なし)',
        'datetime': '2024/03/18 14:00',
        'content': 'これは他人の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真あり)',
        'datetime': '2024/03/18 12:00',
        'content': 'これは自分の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真なし)',
        'datetime': '2024/03/18 12:30',
        'content': 'これは自分の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真あり)',
        'datetime': '2024/03/18 13:00',
        'content': 'これは他人の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真なし)',
        'datetime': '2024/03/18 14:00',
        'content': 'これは他人の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真あり)',
        'datetime': '2024/03/18 12:00',
        'content': 'これは自分の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '12345',
        'username': '自分の投稿 (写真なし)',
        'datetime': '2024/03/18 12:30',
        'content': 'これは自分の投稿で、画像がありません。',
        'image': null,
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真あり)',
        'datetime': '2024/03/18 13:00',
        'content': 'これは他人の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
      },
      {
        'userID': '1',
        'username': '他人の投稿 (写真なし)',
        'datetime': '2024/03/18 14:00',
        'content': 'これは他人の投稿で、画像がありません。',
        'image': null,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('コメント', '(201)'),
        const SizedBox(height: 16),
        TextField(
          controller: myController,
          focusNode: _focusNode,
          minLines: isTextFieldActive ? 3 : 1,
          maxLines: null,
          decoration: InputDecoration(
            suffixIcon: isTextFieldActive ? _buildImageButton() : null,
            hintText: 'コメントする...',
            hintStyle: const TextStyle(color: AppColors.gray3),
            filled: true,
            fillColor: AppColors.white,
            hoverColor: AppColors.white, // ホバー時の色変更を無効化
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
          style: const TextStyle(color: AppColors.gray1),
        ),
        const SizedBox(height: 16),
        // if (isTextFieldActive)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                print('キャンセル');
                myController.clear(); // 入力をクリア
                _selectedImage = null; // 画像をクリア
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white, // 背景色
                foregroundColor: AppColors.gray2, // 文字色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                fixedSize: const Size(100, 36),
                padding: EdgeInsets.zero, // 余白をなくす
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
                print('コメントを投稿');
                comment = myController.text;
                print(comment);
                //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                // API繋ぎ込みで修正が必要 (コメントの投稿)
                //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                final uploadData = [
                  {
                    'userID': '12345',
                    'username': 'ユーザー名',
                    'datetime': '2024/03/18 12:00',
                    'content': comment,
                    'image':
                        _selectedImage != null ? _selectedImage!.path : null,
                  }, // アップロードするデータ
                ];

                myController.clear(); // 入力をクリア
                _selectedImage = null; // 画像をクリア
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green1, // 背景色
                foregroundColor: AppColors.white, // 文字色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                fixedSize: const Size(100, 36),
                padding: EdgeInsets.zero, // 余白をなくす
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
        const SizedBox(height: 16),
        Column(
          children: comments.map((comment) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.gray2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                      // API繋ぎ込みで修正が必要　　アイコンの表示
                      //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                      'assets/images/FlyedSawagani.png',
                      width: 28,
                      height: 28,
                      fit: BoxFit.cover,
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
                                children: [
                                  Text(
                                    comment['username']! as String,
                                    style:
                                        const TextStyle(color: AppColors.gray1),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    comment['datetime']! as String,
                                    style:
                                        const TextStyle(color: AppColors.gray2),
                                  ),
                                ],
                              ),
                            ),
                            if (comment['userID'] == '12345') //ユーザーが自分自身かどうか判定
                              const Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(Icons.more_horiz, size: 16),
                              ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                comment['content']! as String,
                                style: const TextStyle(color: AppColors.gray1),
                                softWrap: true,
                              ),
                            ),
                            if (comment['image'] != null) ...[
                              const SizedBox(width: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                  comment['image']! as String,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
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
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: AppColors.green3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'もっと見る',
              style: TextStyle(color: AppColors.gray1),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildTitle(String title, String subtitle) {
  return Stack(
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.gray1,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.gray1,
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
