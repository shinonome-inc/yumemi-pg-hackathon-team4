import 'package:client/constants/app_colors.dart';
import 'package:client/extensions/build_context_extension.dart';
import 'package:client/extensions/text_theme_extension.dart';
import 'package:client/pages/recipe_list/recipe_list_item_component.dart';
import 'package:client/pages/recipe_list/recipe_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecipeListPage extends ConsumerStatefulWidget {
  const RecipeListPage({
    super.key,
  });

  @override
  ConsumerState createState() => _TopPageState();
}

class _TopPageState extends ConsumerState<RecipeListPage> {
  final List<String> _items = <String>[
    '人気順',
    '新着順',
  ];
  String _selectedItem = '人気順';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref
          .read(recipeListNotifierProvider.notifier)
          .fetchRecipesAndUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(recipeListNotifierProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            spacing: 16,
            children: [
              // 検索バー（固定）
              Container(
                height: 36,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'レシピを検索',
                    hintStyle: const TextStyle(
                      color: AppColors.gray2,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppColors.gray4,
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search,
                        color: AppColors.gray1,
                        size: 20,
                      ),
                    ),
                    suffixIcon: _controller.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(
                              Icons.clear,
                              color: AppColors.gray2,
                              size: 20,
                            ),
                            onPressed: () {
                              _controller.clear();
                              setState(() {}); // クリア後にUI更新
                            },
                          )
                        : null,
                  ),
                ),
              ),

              // タイトル + ドロップダウン (固定)
              Row(
                children: [
                  Text(
                    'みんなのレシピ',
                    style: context.textTheme.titleLargeBold
                        ?.copyWith(color: AppColors.green1),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 32,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        padding: const EdgeInsets.only(left: 16, right: 8),
                        borderRadius: BorderRadius.circular(8),
                        value: _selectedItem,
                        items: _items.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: AppColors.gray1),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedItem = newValue.toString();
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.gray1,
                        ),
                        style: const TextStyle(fontSize: 14),
                        dropdownColor: Colors.white,
                        focusColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),

              // レシピリスト（スクロール可能）
              Expanded(
                child: ListView.builder(
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = state.recipes.elementAt(index);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: RecipeItem(
                        title: recipe.title,
                        description: recipe.description,
                        userImageUrl: recipe.user.imageUrl,
                        userName: recipe.user.name,
                        likes: recipe.likesCounts,
                        comments: recipe.comments.length,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
