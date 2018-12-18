# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.conf.urls import include
from django.contrib.auth import views as auth_views


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
    url(r'^topic/(?P<pk>\d+)/post_add/$', views.PostCreate.as_view(),
        name='post_add'),
    url(r'^topic/(?P<pk>\d+)/posts$', views.PostListView.as_view(),
        name='post'),
#    url(r'^topic/(?P<pk>\d+)/post/(?P<post_pk>\d+)$', views.PostDetailView.as_view(),
#        name='post-detail'),
#    url(r'^topic/(?P<pk>\d+)/post/(?P<post_pk>\d+)/update/$', views.PostUpdate.as_view(),
#        name='post_update'),
#    url(r'^topic/(?P<pk>\d+)/post/(?P<post_pk>\d+)/delete/$', views.PostDelete.as_view(),
#        name='post_delete'),

    url(r'^post/(?P<pk>\d+)$', views.PostDetailView.as_view(),
        name='post-detail'),
    url(r'^post/(?P<pk>\d+)/update/$', views.PostUpdate.as_view(),
        name='post_update'),
    url(r'^post/(?P<pk>\d+)/delete/(?P<top_pk>\d+)$', views.PostDelete.as_view(),
        name='post_delete'),
#Add Django site authentication urls (for login, logout, password management)
#    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^accounts/login/$', auth_views.login, {'template_name': 'login.html'}, name='login'),
    url(r'^accounts/logout/$', auth_views.logout, {'template_name': 'logged_out.html'}, name='logout'),
#    url(r'^blog/(?P<year>[0-9]{4})/$', views.year_archive, {'foo': 'bar'}),
]

#url(r'^topic/(?P<pk>\d+)/post_add$', views.post_add, name='post_add'),
#    url(r'^post/(?P<pk>\d+)$', views.PostDetailView.as_view(),
#        name='post-detail'),
#    url(r'^post/(?P<pk>\d+)/update/$', views.PostUpdate.as_view(),
#        name='post_update'),
#    url(r'^post/(?P<pk>\d+)/delete/$', views.PostDelete.as_view(),
#        name='post_delete'),