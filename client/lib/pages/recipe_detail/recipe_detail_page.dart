import 'package:client/constants/app_colors.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
      body: Container(
        color: AppColors.white,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 393 / 351,
              child: Image.asset(
                'assets/images/FlyedSawagani.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 24,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'レシピタイトルレシピタイトルレシピタイトルレシピタイトルレシピタイトル',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/FlyedSawagani.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('ユーザー名'),
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
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.thumb_up,
                              size: 20,
                              color: AppColors.green1,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '123',
                              style: TextStyle(color: AppColors.green1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity, // 横幅いっぱい
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.green3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'コメント内容コメント内容コメント内容コメント内容コメント内容コメント内容',
                      style: TextStyle(color: AppColors.gray1A80),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '投稿日: YYYY/MM/DD',
                      style: TextStyle(color: AppColors.gray2),
                    ),
                  ),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                tabBarTheme: const TabBarTheme(
                  dividerColor: AppColors.green2, // デフォルトのDividerの色を変更
                ),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.green1,
                unselectedLabelColor: AppColors.green1_50,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.green1,
                    width: 3,
                  ), // アクティブなタブのアンダーバーの太さを2px
                ),
                tabs: const [
                  Tab(text: '作り方'),
                  Tab(text: 'コメント'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  RecipeStepsComponent(),
                  CommentsComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeStepsComponent extends StatelessWidget {
  const RecipeStepsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('作り方の内容'));
  }
}

class CommentsComponent extends StatelessWidget {
  const CommentsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('コメントの内容'));
  }
}
