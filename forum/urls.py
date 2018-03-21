# -*- coding: utf-8 -*-
from django.conf.urls import url

from . import views


urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^category/$', views.CategoryListView.as_view(),
        name='category'),
    url(r'^category/(?P<pk>\d+)$', views.CategoryDetailView.as_view(),
        name='category-detail'),
    url(r'^category/(?P<pk>\d+)/forums$', views.ForumListView.as_view(),
        name='forum'),

    url(r'^forum/$', views.AllForumListView.as_view(),
        name='allforum'),
    url(r'^forum/(?P<pk>\d+)$', views.ForumDetailView.as_view(),
        name='forum-detail'),


    url(r'^forum/(?P<pk>\d+)/topic_add/$', views.TopicCreate.as_view(),
        name='topic_add'),


    url(r'^forum/(?P<pk>\d+)/topics$', views.TopicListView.as_view(),
        name='topic'),
    url(r'^topic/(?P<pk>\d+)$', views.TopicDetailView.as_view(),
        name='topic-detail'),

    url(r'^topic/(?P<pk>\d+)/update/$', views.TopicUpdate.as_view(),
        name='topic_update'),
    url(r'^topic/(?P<pk>\d+)/delete/$', views.TopicDelete.as_view(),
        name='topic_delete'),

    url(r'^topic/(?P<pk>\d+)/posts$', views.PostListView.as_view(),
        name='post'),
    url(r'^post/(?P<pk>\d+)$', views.PostDetailView.as_view(),
        name='post-detail'),
    url(r'^topic/(?P<pk>\d+)/post_add$', views.post_add, name='post_add'),
]
