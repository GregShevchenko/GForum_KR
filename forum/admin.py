from django.contrib import admin

# Register your models here.
from .models import Category, Forum, Topic, Post


admin.site.register(Category)
#admin.site.register(Forum)

# Define the admin class
#class CategoryAdmin(admin.ModelAdmin):
#    pass

# Register the admin class with the associated model
#admin.site.register(Category, CategoryAdmin)


class ForumAdmin(admin.ModelAdmin):

     list_display = ('title', 'category', 'created')
     list_filter = ('category', 'updated', 'created')

admin.site.register(Forum, ForumAdmin)

class TopicAdmin(admin.ModelAdmin):

     list_display = ('title', 'forum', 'updated', 'created', 'closed', 'top_fix')
     list_filter = ('forum', 'updated', 'created', 'closed', 'top_fix')

admin.site.register(Topic, TopicAdmin)

class PostAdmin(admin.ModelAdmin):

     list_display = ('title', 'topic', 'created', 'forum', 'creator')
     list_filter = ('title', 'topic', 'created', 'forum', 'creator')

admin.site.register(Post, PostAdmin)



