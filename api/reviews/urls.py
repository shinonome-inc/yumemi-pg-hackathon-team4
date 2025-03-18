from django.urls import path
from .views import LikeRecipeView, CommentRecipeView, GetCommentsView

urlpatterns = [
    path('recipes/<int:recipe_id>/likes/', LikeRecipeView.as_view(), name='like_recipe'),
    path('recipes/<int:recipe_id>/comments/', CommentRecipeView.as_view(), name='comment_on_recipe'),
    path('recipes/<int:recipe_id>/comments/<int:comment_id>/', CommentRecipeView.as_view(), name='update_delete_comment'),
]
