from django.urls import path

from .views import CommentRecipeView, LikeRecipeView

urlpatterns = [
    path(
        "recipes/<int:recipe_id>/likes/", LikeRecipeView.as_view(), name="like_recipe"
    ),
    path(
        "recipes/<int:recipe_id>/comments/",
        CommentRecipeView.as_view(),
        name="post_get_recipe",
    ),
    path(
        "recipes/<int:recipe_id>/comments/<int:comment_id>/",
        CommentRecipeView.as_view(),
        name="update_delete_comment",
    ),
]
