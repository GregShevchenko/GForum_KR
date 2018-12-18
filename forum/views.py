from django.shortcuts import render
from django.views import generic
from django.shortcuts import get_object_or_404
#from .forms import PostForm
from .models import Category, Forum, Topic, Post
from django.contrib.auth.mixins import LoginRequiredMixin

def index(request):
    """
    Функция отображения для домашней страницы сайта.
    """

    num_category=Category.objects.all().count()
    num_forum=Forum.objects.all().count()
    num_topic=Topic.objects.all().count()
    num_post=Post.objects.all().count()
        # Number of visits to this view, as counted in the session variable.
    num_visits=request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits+1
    # Отрисовка HTML-шаблона index.html с данными внутри переменной контекста context
    return render(
        request,
        'index.html',
        context={'num_category': num_category, 'num_forum': num_forum,
            'num_topic': num_topic, 'num_post': num_post, 'num_visits': num_visits}
    )


class CategoryListView(generic.ListView):
    model = Category
    template_name = 'category_list.html'
    paginate_by = 10

class CategoryDetailView(generic.DetailView):
    model = Category
    template_name = 'category_detail.html'

class AllForumListView(generic.ListView):
    model = Forum
    template_name = 'allforum_list.html'
    paginate_by = 20
    num_all_forum = Forum.objects.all().count()

    def get_context_data(self, **kwargs):
        context = super(AllForumListView, self).get_context_data(**kwargs)
        context['num_all_forum'] = Forum.objects.all().count()
        return context

class ForumListView(generic.ListView):
    model = Forum
    template_name = 'forum_list.html'
    paginate_by = 10

    def get_queryset(self):
        self.category = get_object_or_404(Category, id=self.kwargs['pk'])
        return Forum.objects.filter(category=self.category)

    def get_context_data(self, **kwargs):
        context = super(ForumListView, self).get_context_data(**kwargs)
        context['num_forum_for_category'] = Forum.objects.filter(category_id=self.kwargs['pk']).count()
        return context

class ForumDetailView(generic.DetailView):
    model = Forum
    template_name = 'forum_detail.html'


class TopicListView(generic.ListView):
    model = Topic
    template_name = 'topic_list.html'
    paginate_by = 10

    def get_queryset(self):
        self.forum = get_object_or_404(Forum, id=self.kwargs['pk'])
        return Topic.objects.filter(forum=self.forum)

    def get_context_data(self, **kwargs):
        context = super(TopicListView, self).get_context_data(**kwargs)
        context['num_topic_for_forum'] = Topic.objects.filter(forum_id=self.kwargs['pk']).count()
        context['id_forum'] = self.kwargs['pk']
        return context


class TopicDetailView(generic.DetailView):
    model = Topic
    template_name = 'topic_detail.html'


class PostListView(generic.ListView):
    model = Post
    template_name = 'post_list.html'
    paginate_by = 5

    def get_queryset(self):
        self.topic = get_object_or_404(Topic, id=self.kwargs['pk'])
        return Post.objects.filter(topic=self.topic)

    def get_context_data(self, **kwargs):
        context = super(PostListView, self).get_context_data(**kwargs)
        self.topic = get_object_or_404(Topic, id=self.kwargs['pk'])
        context['topic_descript'] = self.topic.description
        context['num_post_for_topic'] = Post.objects.filter(topic_id=self.kwargs['pk']).count()
        context['id_topic'] = self.kwargs['pk']
        return context


class PostDetailView(generic.DetailView):
    model = Post
    template_name = 'post_detail.html'

    def get_object(self):
        return get_object_or_404(Post, pk=self.kwargs.get("pk"))


from django.http import HttpResponseRedirect
from .forms import PostForm, TopicForm

from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy


class TopicCreate(LoginRequiredMixin, CreateView):
    model = Topic
    template_name = 'topic_add.html'
    form_class = TopicForm
    login_url = '/forum/accounts/login/'
#    redirect_field_name = 'redirect_to'

    def form_valid(self, form):
        form.instance.creator = self.request.user
        form.instance.forum = get_object_or_404(Forum, id=self.kwargs['pk'])
        return super(TopicCreate, self).form_valid(form)


class TopicUpdate(LoginRequiredMixin, UpdateView):
    model = Topic
    template_name = 'topic_add.html'
    form_class = TopicForm
    login_url = '/forum/accounts/login/'
#    def form_valid(self, form):
#        form.instance.creator = self.request.user
#        form.instance.forum = get_object_or_404(Forum, id=self.kwargs['pk'])
#        return super(TopicUpdate, self).form_valid(form)


class TopicDelete(LoginRequiredMixin, DeleteView):
    model = Topic
    success_url = reverse_lazy('topic')
    login_url = '/forum/accounts/login/'


class PostCreate(LoginRequiredMixin, CreateView):
    model = Post
    template_name = 'post_add.html'
    form_class = PostForm
    login_url = '/forum/accounts/login/'

    def get_success_url(self):
        pk = self.kwargs['pk']
        return ('/forum/topic/%s/posts' % pk)

    def form_valid(self, form):
        form.instance.creator = self.request.user
        form.instance.topic = get_object_or_404(Topic, id=self.kwargs['pk'])
        form.instance.forum = get_object_or_404(Forum, id=form.instance.topic.forum.id)
        return super(PostCreate, self).form_valid(form)


class PostUpdate(LoginRequiredMixin, UpdateView):
    model = Post
    template_name = 'post_edit.html'
    form_class = PostForm
    login_url = '/forum/accounts/login/'
#    def form_valid(self, form):
#        form.instance.creator = self.request.user
#        form.instance.forum = get_object_or_404(Forum, id=self.kwargs['pk'])
#        return super(TopicUpdate, self).form_valid(form)


class PostDelete(LoginRequiredMixin, DeleteView):
    model = Post
    template_name = 'post_del.html'
    login_url = '/forum/accounts/login/'

    def get_success_url(self):
        pk = self.kwargs['top_pk']
        return reverse_lazy('post', kwargs={'pk': pk})
