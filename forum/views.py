from django.shortcuts import render
from django.views import generic
from django.shortcuts import get_object_or_404
#from .forms import PostForm
from .models import Category, Forum, Topic, Post
#from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

def index(request):
    """
    Функция отображения для домашней страницы сайта.
    """
    # Генерация "количеств" некоторых главных объектов
    num_category=Category.objects.all().count()
    num_forum=Forum.objects.all().count()
    num_topic=Topic.objects.all().count()
    num_post=Post.objects.all().count()
    # Доступные книги (статус = 'a')
#    num_instances_available=BookInstance.objects.filter(status__exact='a').count()
    # Метод 'all()' применен по умолчанию.

    # Отрисовка HTML-шаблона index.html с данными внутри переменной контекста context
    return render(
        request,
        'index.html',
        context={'num_category':num_category, 'num_forum':num_forum,
            'num_topic':num_topic, 'num_post':num_post}
#                        context={'num_category':num_category,'num_forum':num_forum,
#            'num_topic':num_topic,'num_post':num_post},
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

class ForumListView(generic.ListView):
    model = Forum
    template_name = 'forum_list.html'
    paginate_by = 10

    def get_queryset(self):
        self.category = get_object_or_404(Category, id=self.kwargs['pk'])
        return Forum.objects.filter(category=self.category)

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


class PostDetailView(generic.DetailView):
    model = Post
    template_name = 'post_detail.html'


from django.http import HttpResponseRedirect
from .forms import PostForm

def post_add(request, pk):
    topic=get_object_or_404(Topic, pk = pk)
    form = PostForm()
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            post.topic = topic
            post.creator = request.user
            post.save()
#        return redirect('topic_detail', pk=post.pk)
#        return HttpResponseRedirect(reverse('topic_detail', args=(topic.id, )))
        return HttpResponseRedirect('/forum/topic/%s' % pk)

    return render(request, 'post_add.html', {'form': form})













