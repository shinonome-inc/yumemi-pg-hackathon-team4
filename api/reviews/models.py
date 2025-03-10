from django.db import models
# Create your models here.
class Likes(models.Model):
    review = models.OneToOneField('reviews.Review', on_delete=models.CASCADE, related_name='likes')
    created_at = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey('users.User', on_delete=models.CASCADE, related_name='likes')

    def __str__(self):
        return f'{self.user} likes {self.review}'
    
class Comment(models.Model):
    user = models.ForeignKey('users.User', on_delete=models.CASCADE, related_name='comments')
    review = models.ForeignKey('reviews.Review', on_delete=models.CASCADE, related_name='comments')
    content_text = models.TextField()
    image_url = models.URLField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    
