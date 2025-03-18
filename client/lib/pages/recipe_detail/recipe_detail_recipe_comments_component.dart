import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RecipeCommentsComponent extends StatelessWidget {
  const RecipeCommentsComponent({super.key});

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
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'コメントする...',
            hintStyle: const TextStyle(color: AppColors.gray3),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              // 非アクティブ時の枠線
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.gray3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.green1),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          cursorColor: AppColors.green1,
          style: const TextStyle(color: AppColors.gray1),
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
          child: ElevatedButton(
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
