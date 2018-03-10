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
#    num_topic=Topic.objects.all().count()
#    num_post=Post.objects.all().count()
    # Доступные книги (статус = 'a')
#    num_instances_available=BookInstance.objects.filter(status__exact='a').count()
    # Метод 'all()' применен по умолчанию.

    # Отрисовка HTML-шаблона index.html с данными внутри переменной контекста context
    return render(
        request,
        'index.html',
        context={'num_category':num_category},
#                        context={'num_category':num_category,'num_forum':num_forum,
#            'num_topic':num_topic,'num_post':num_post},
    )


class CategoryListView(generic.ListView):
    model = Category
    template_name = 'category_list.html'
    paginate_by = 3

class CategoryDetailView(generic.DetailView):
    model = Category
    template_name = 'category_detail.html'
#    paginate_by = 5

class AllForumListView(generic.ListView):
    model = Forum
    template_name = 'allforum_list.html'
    paginate_by = 5

class ForumListView(generic.ListView):
    model = Forum
    template_name = 'forum_list.html'
    paginate_by = 3

    def get_queryset(self):
        self.category = get_object_or_404(Category, id=self.kwargs['pk'])
        return Forum.objects.filter(category=self.category)

class ForumDetailView(generic.DetailView):
    model = Forum
    template_name = 'forum_detail.html'
    paginate_by = 5













