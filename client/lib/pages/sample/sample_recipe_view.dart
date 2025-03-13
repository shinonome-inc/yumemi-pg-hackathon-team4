import 'package:client/pages/sample/sample_state.dart';
import 'package:flutter/material.dart';

class SampleRecipeView extends StatelessWidget {
  const SampleRecipeView({
    super.key,
    required this.state,
  });

  final SampleState state;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: state.recipes.length,
      itemBuilder: (context, index) {
        final recipe = state.recipes.elementAt(index);
        return Column(
          children: [
            ExpansionTile(
              title: Text(recipe.title),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    children: [
                      ExpansionTile(
                        title: const Text('食材'),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe.ingredients.length,
                            itemBuilder: (context, index) {
                              final ingredient =
                                  recipe.ingredients.elementAt(index);
                              return ListTile(
                                title: Text(ingredient.ingredientName),
                                subtitle: Text(ingredient.quantity),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('採取方法'),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe.gatheringSteps.length,
                            itemBuilder: (context, index) {
                              final gatheringSteps =
                                  recipe.gatheringSteps.elementAt(index);
                              return ListTile(
                                title: Text(gatheringSteps.description),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('調理方法'),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe.cookingSteps.length,
                            itemBuilder: (context, index) {
                              final cookingSteps =
                                  recipe.cookingSteps.elementAt(index);
                              return ListTile(
                                title: Text(cookingSteps.description),
                              );
                            },
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: const Text('コメント'),
                        children: <Widget>[
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipe.comments.length,
                            itemBuilder: (context, index) {
                              final comment = recipe.comments.elementAt(index);
                              final titleText =
                                  '${comment.user.name}「${comment.contentText}」';
                              return ListTile(
                                title: Text(titleText),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
