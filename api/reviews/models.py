from django.db import models


# Create your models here.
class Like(models.Model):
    recipe = models.ForeignKey("recipes.Recipe", on_delete=models.CASCADE, related_name="like")
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(
        "users.User", on_delete=models.CASCADE, related_name="likes"
    )

    def __str__(self):
        return f"{self.user} likes {self.recipe}"


class Comment(models.Model):
    user = models.ForeignKey(
        "users.User", on_delete=models.CASCADE, related_name="comments"
    )
    recipe = models.ForeignKey(
        "recipes.Recipe", on_delete=models.CASCADE, related_name="comments"
    )
    content_text = models.TextField(blank=True, null=True)
    image_url = models.URLField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    
