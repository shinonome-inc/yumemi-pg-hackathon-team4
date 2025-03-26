import 'package:client/constants/app_colors.dart';
import 'package:client/enums/app_page.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/models/recipe.dart';
import 'package:client/pages/recipe_detail/recipe_detail_recipe_comments_component.dart';
import 'package:client/pages/recipe_detail/recipe_detail_recipe_steps_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class RecipeDetailPage extends ConsumerStatefulWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  ConsumerState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends ConsumerState<RecipeDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('yyyy/MM/dd').format(widget.recipe.createdAt);
    final apiData = {
      'titleImage': widget.recipe.thumbnailImageUrls[0],
      'recipeTitle': widget.recipe.title,
      'userIcon': widget.recipe.user.imageUrl,
      'userName': widget.recipe.user.name,
      'likeCount': widget.recipe.likesCounts.toString(),
      'comment': widget.recipe.description,
      'createdAt': formattedDate,
    };

    return Scaffold(
      backgroundColor: AppColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 64,
            surfaceTintColor: AppColors.white,
            backgroundColor: AppColors.white,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, size: 24),
              iconSize: 24,
              onPressed: () => context.pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: IconButton(
                  onPressed: () {
                    context.push(
                      AppPage.recipeEditForm.path,
                      extra: widget.recipe,
                    );
                  },
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 393 / 351,
                  child: Image.network(
                    apiData['titleImage']!,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipe.title,
                        style: context.textTheme.titleLargeBold?.copyWith(
                          color: AppColors.gray1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.push(
                                AppPage.user.path,
                              );
                            },
                            child: Row(
                              spacing: 4,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: ClipOval(
                                    child: Image.network(
                                      apiData['userIcon']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  apiData['userName']!,
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.gray1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _isLiked
                                  ? AppColors.green1
                                  : Colors.transparent,
                              side: const BorderSide(color: AppColors.green1),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/thumb_up.svg',
                                  width: 20,
                                  height: 20,
                                  colorFilter: ColorFilter.mode(
                                    _isLiked
                                        ? AppColors.white
                                        : AppColors.green1,
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  apiData['likeCount']!,
                                  style:
                                      context.textTheme.titleMedium?.copyWith(
                                    color: _isLiked
                                        ? AppColors.white
                                        : AppColors.green1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.green3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          apiData['comment']!,
                          style: context.textTheme.titleSmall?.copyWith(
                            color: AppColors.gray1A80,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '投稿日：${apiData['createdAt']!}',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.gray2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                dividerColor: AppColors.green1_50,
                controller: _tabController,
                labelColor: AppColors.green1,
                unselectedLabelColor: AppColors.green1_50,
                labelStyle: context.textTheme.titleLargeBold?.copyWith(
                  color: AppColors.green1,
                ),
                unselectedLabelStyle: context.textTheme.titleMedium?.copyWith(
                  color: AppColors.green1_50,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.green1,
                    width: 3,
                  ),
                ),
                tabs: const [
                  Tab(text: '作り方'),
                  Tab(text: 'コメント'),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            RecipeStepsComponent(recipe: widget.recipe),
            RecipeCommentsComponent(recipe: widget.recipe),
          ],
        ),
      ),
    );
  }
}

/// タブを固定するためのカスタム `SliverPersistentHeaderDelegate`
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: AppColors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
