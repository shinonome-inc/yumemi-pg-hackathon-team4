import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isTextFieldActive = _focusNode.hasFocus;
        print(isTextFieldActive);
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCommentSection(),
        ],
      ),
    );
  }

  Widget _buildCommentSection() {
    final comments = [
      {
        'username': '自分の投稿 (写真あり)',
        'datetime': '2024/03/18 12:00',
        'content': 'これは自分の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
        'isOwn': true,
      },
      {
        'username': '自分の投稿 (写真なし)',
        'datetime': '2024/03/18 12:30',
        'content': 'これは自分の投稿で、画像がありません。',
        'image': null,
        'isOwn': true,
      },
      {
        'username': '他人の投稿 (写真あり)',
        'datetime': '2024/03/18 13:00',
        'content': 'これは他人の投稿で、画像があります。',
        'image': 'assets/images/FlyedSawagani.png',
        'isOwn': false,
      },
      {
        'username': '他人の投稿 (写真なし)',
        'datetime': '2024/03/18 14:00',
        'content': 'これは他人の投稿で、画像がありません。',
        'image': null,
        'isOwn': false,
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
            suffixIcon: isTextFieldActive // フォーカスがある時のみ表示
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: FilledButton(
                        onPressed: () {
                          print('表示ボタンが押されました');
                        },
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: AppColors.gray4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: AppColors.gray3),
                          ),
                        ),
                        child: const Column(
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
                                fontFamily: 'NotoSansJP',
                                fontSize: 10,
                                color: AppColors.gray2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : null, // フォーカスがない時は `suffixIcon` を非表示
            hintText: 'コメントする...',
            hintStyle: const TextStyle(color: AppColors.gray3),
            filled: true,
            fillColor: AppColors.white,
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
                // 入力をクリア
                myController.clear();
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
                // 入力をクリア
                myController.clear();
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
                            if (comment['isOwn'] == true)
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
