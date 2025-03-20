import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.title,
    required this.description,
    required this.userImageUrl,
    required this.userName,
    required this.likes,
    required this.comments,
    // required this.thumbnailUrl,
  });

  final String title;
  final String description;
  final String userImageUrl;
  final String userName;
  final int likes;
  final int comments;
  // final String thumbnailUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      shadowColor: AppColors.gray4,
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          children: [
            // 画像部分
            Image.asset(
              'assets/images/FlyedSawagani.png',
              width: 160,
              height: 120,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleSmallBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: AppColors.gray2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        spacing: 4,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.gray3,
                            // backgroundImage: NetworkImage(userImageUrl),
                            radius: 7,
                          ),
                          Text(
                            userName,
                            style: context.textTheme.labelSmall,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.thumb_up_alt_outlined,
                            size: 12,
                            color: AppColors.gray1,
                          ),
                          Text(
                            '$likes',
                            style: context.textTheme.labelSmallBold,
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.chat_bubble_outline,
                            size: 12,
                            color: AppColors.gray1,
                          ),
                          Text(
                            '$comments',
                            style: context.textTheme.labelSmallBold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
