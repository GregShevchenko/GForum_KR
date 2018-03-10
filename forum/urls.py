# -*- coding: utf-8 -*-
from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^category/$', views.CategoryListView.as_view(), name='category'),
    url(r'^category/(?P<pk>\d+)$', views.CategoryDetailView.as_view(), name='category-detail'),
    url(r'^category/(?P<pk>\d+)/forums$', views.ForumListView.as_view(), name='forum'),
    url(r'^forums/$', views.AllForumListView.as_view(), name='allforum'),
    url(r'^forum/(?P<pk>\d+)$', views.ForumDetailView.as_view(), name='forum-detail'),
#    url(r'^category/(?P<pk>\d+)$', views.ForumListView.as_view(), name='forum'),
#    url(r'^forum/(?P<pk>\d+)$', views.ForumDetailView.as_view(), name='forum-detail'),
#    url(r'^topic/$', views.TopicListView.as_view(), name='topic'),
#    url(r'^topic/(?P<pk>\d+)$', views.TopicDetailView.as_view(), name='topic-detail'),
#    url(r'^post/$', views.PostListView.as_view(), name='post'),
#    url(r'^post/(?P<pk>\d+)$', views.PostDetailView.as_view(), name='post-detail'),
#    url(r'^topic/(?P<pk>\d+)$', views.TopicDetailView.as_view(), name='topic-detail'),
#    url(r'^topic/(?P<pk>\d+)/add/$', views.post_add, name='post_add'),
]
#<int:pk>
#(?P<pk>[-\w]+)
#(?P<pk>\d+)




#    url(r'^post/add/$', views.post_add, name='post_add'),
#    url(r'^topic/(?P<pk>\d+)/add/$', views.PostCreate.as_view(), name='post_add'),
#    url(r'^post/add/$', views.PostCreate.as_view(), name='post_add'),
#url(r'^book/(?P<pk>[-\w]+)/renew/$



#    url(r'^$', views.index, name='index'),
#    url(r'^category/$', views.CategoryListView.as_view(), name='category'),
#    url(r'^category/(?P<pk>\d+)$', views.CategoryDetailView.as_view(), name='category-detail'),
#    url(r'^forum/$', views.ForumListView.as_view(), name='forum'),
#    url(r'^forum/(?P<pk>\d+)$', views.ForumDetailView.as_view(), name='forum-detail'),
#    url(r'^topic/$', views.TopicListView.as_view(), name='topic'),
#    url(r'^topic/(?P<pk>\d+)$', views.TopicDetailView.as_view(), name='topic-detail'),
#    url(r'^post/$', views.PostListView.as_view(), name='post'),
#    url(r'^post/(?P<pk>\d+)$', views.PostDetailView.as_view(), name='post-detail'),
#    url(r'^topic/(?P<pk>\d+)$', views.TopicDetailView.as_view(), name='topic-detail'),
#    url(r'^topic/(?P<pk>\d+)/add/$', views.post_add, name='post_add'),