import 'package:client/constants/app_colors.dart';
import 'package:client/pages/recipe_detail/recipe_detail_recipe_comments_component.dart';
import 'package:client/pages/recipe_detail/recipe_detail_recipe_steps_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeDetailPage extends ConsumerStatefulWidget {
  const RecipeDetailPage({super.key});

  @override
  ConsumerState createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends ConsumerState<RecipeDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // API繋ぎ込みで修正が必要
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    final apiData = {
      'titleImage': 'assets/images/FlyedSawagani.png',
      'recipeTitle': 'レシピタイトルレシピタイトルレシピタイトルレシピタイトルレシピタイトル',
      'userIcon': 'assets/images/FlyedSawagani.png',
      'userName': 'ユーザー名',
      'likeCount': '123',
      'comment': 'コメント内容コメント内容コメント内容コメント内容コメント内容コメント内容',
      'postDate': 'YYYY/MM/DD',
    };
    return Scaffold(
      backgroundColor: AppColors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: AppColors.white,
            pinned: true,
            expandedHeight: 300, // 画像の高さ
            flexibleSpace: FlexibleSpaceBar(
              background: AspectRatio(
                aspectRatio: 393 / 351,
                child: Image.asset(
                  apiData['titleImage']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 24),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: IconButton(
                  icon: const Icon(Icons.edit, size: 24),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    apiData['recipeTitle']!,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          apiData['userIcon']!,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(apiData['userName']!),
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppColors.green1),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.thumb_up,
                              size: 20,
                              color: AppColors.green1,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              apiData['likeCount']!,
                              style: const TextStyle(color: AppColors.green1),
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
                      style: const TextStyle(color: AppColors.gray1A80),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '投稿日：${apiData['postDate']!}',
                      style: const TextStyle(color: AppColors.gray2),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: AppColors.green1,
                unselectedLabelColor: AppColors.green1_50,
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
          children: const [
            RecipeStepsComponent(),
            RecipeCommentsComponent(),
          ],
        ),
      ),
    );
  }
}

/// タブを固定するためのカスタム `SliverPersistentHeaderDelegate`
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;
  _TabBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
