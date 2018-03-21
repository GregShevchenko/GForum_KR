from django.db import models
from django.core.urlresolvers import reverse
#Used to generate URLs by reversing the URL patterns
from django.contrib.auth import get_user_model
from django.conf import settings # for "settings.AUTH_USER_MODEL,"


class Category(models.Model):
    name = models.CharField(max_length=80, help_text="Введите название Категории")
    description = models.TextField(blank=True, default='')

    class Meta:
        ordering = ["name"]

    # Methods
    def get_absolute_url(self):
#         """
#         Returns the url to access a particular instance of Category.
#         """
         return reverse('category-detail', args=[str(self.id)])

    def __str__(self):
        """
        String for representing the Category object (in Admin site etc.)
        """
        return self.name


def get_sentinel_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]

class Forum(models.Model):
    category = models.ForeignKey(Category,
        on_delete=models.SET_NULL, blank=True, null=True)
    title = models.CharField(max_length=80)
    description = models.TextField(blank=True, default='')
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    creator = models.ForeignKey(settings.AUTH_USER_MODEL,
        on_delete=models.SET(get_sentinel_user),)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        """
        Returns the url to access a particular book instance.
        """
        return reverse('forum-detail', args=[str(self.id)])


class Topic(models.Model):
    title = models.CharField(max_length=60)
    description = models.TextField(max_length=10000, blank=False, null=True)
    forum = models.ForeignKey(Forum,
        on_delete=models.SET_NULL, blank=True, null=True)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    creator = models.ForeignKey(settings.AUTH_USER_MODEL,
        on_delete=models.SET(get_sentinel_user),)
    closed = models.BooleanField(blank=True, default=False,
        verbose_name = "Закрытая")
    top_fix = models.BooleanField(blank=True, default=False,
        verbose_name = "Закрепленая")

    class Meta:
        ordering = ["top_fix", "-created"]
        unique_together = ("title", "created")

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        """
        Returns the url to access a particular book instance.
        """
        return reverse('topic-detail', args=[str(self.id)])
#        return reverse('topic-detail', args=[self.pk])
#        return reverse('topic-detail', kwargs={'pk':self.id})




class Post(models.Model):
    title = models.CharField(max_length=100)
    content = models.TextField(max_length=10000, blank=True, null=True)
    forum = models.ForeignKey(Forum,
        on_delete=models.SET_NULL, blank=True, null=True)
    topic = models.ForeignKey(Topic,
        on_delete=models.CASCADE, blank=False, null=False)
    updated = models.DateTimeField(auto_now=True)
    created = models.DateTimeField(auto_now_add=True)
    creator = models.ForeignKey(settings.AUTH_USER_MODEL,
        on_delete=models.SET(get_sentinel_user),)

    class Meta:
        ordering = ["created"]

    def __str__(self):
        return self.title

    def get_absolute_url(self):
#        from django.urls import reverse
        """
        Returns the url to access a particular book instance.
        """
        return reverse('post-detail', args=[str(self.id)])
#        return reverse('topic-detail', kwargs={'pk':self.id})
#        return reverse('post-detail', args=[self.pk])#(), kwargs = {'pk': self.pk}))

        #args=[str(self.id)],



