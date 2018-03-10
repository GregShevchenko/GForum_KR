class TopicDetailView(generic.DetailView, MultipleObjectMixin):
    model = Topic
    template_name = 'topic_detail.html'
    paginate_by = 3

    def get_queryset(self):
#        self.topic=Topic.objects.get()
#        self.topic = get_object_or_404(Topic, id=self.kwargs['pk'])
        return Post.objects.filter(topic_id=self.object)
#    def get_queryset(self):
#        self.publisher = get_object_or_404(Publisher, name=self.kwargs['publisher'])
#        return Book.objects.filter(publisher=self.publisher)
#        return Post.objects.filter(topic_id=self.kwargs['pk'])


    def get_context_data(self, **kwargs):
        context = super(TopicDetailView, self).get_context_data(**kwargs)
        num_post_for_topic = Post.objects.filter(topic_id=self.kwargs['pk']).count()
#        context['list_post'] = Post.objects.filter(topic_id=self.kwargs['pk'])
#        context['post_list'] = Post.objects.filter(topic_id=self.kwargs['pk'])
        post_list = Post.objects.filter(topic_id=self.kwargs['pk'])
#        purchases = self.object.get_post_list().filter()
#        number = num_post_for_topic
#        page = request.GET.get('page', 1)
        page = self.request.GET.get('page', 1)
        paginator = Paginator(post_list, self.paginate_by)
#        post_paginator = paginator.Paginator(list_post, self.paginate_by)
        try:
            page_obj = paginator.page(page)
        except (PageNotAnInteger):
            page_obj = paginator.page(1)
        except (EmptyPage):
            page_obj = paginator.page(paginator.num_pages)
        context["page_obj"] = page_obj
#        context['list_post'] = Post.objects.filter(topic_id=self.kwargs['pk'])
#        purchases_paginator = paginator.Paginator(purchases, self.paginate_by)
        return context


    <ul>

      {% for post in topic.post_set.all %}
      <li>
        <h1><a href="{{ post.get_absolute_url }}">{{ post.title }}</a></h1>
        <p>Создан: {{ post.created }}</p>
        <p>изменен: {{ post.updated }}</p>
        <p>Автор: {{ post.creator }}</p>
        <p>{{ post.content|linebreaksbr }}</p>

      </li>
      {% endfor %}

    </ul>


class TopicDetailView(generic.DetailView):
    model = Topic
    template_name = 'topic_detail.html'
    paginate_by = 5
    def get_context_data(self, **kwargs):
        context = super(TopicDetailView, self).get_context_data(**kwargs)
        context['num_post_for_topic'] = Post.objects.filter(topic_id=self.kwargs['pk']).count()
        context['list_post'] = Post.objects.filter(topic_id=self.kwargs['pk'])
        return context


class TopicDetailView(generic.DetailView):
    model = Topic
    template_name = 'topic_detail.html'
    paginate_by = 5
    context_object_name = 'list_post1'
    def get_context_data(self, **kwargs):
        context = super(TopicDetailView, self).get_context_data(**kwargs)
        context['num_post_for_topic'] = Post.objects.filter(topic_id=self.kwargs['pk']).count()
        context['list_post'] = Post.objects.filter(topic_id=self.kwargs['pk'])
        return context

    def get_queryset(self, **kwargs):
#        context = super(TopicDetailView, self).get_context_data(**kwargs)
#       list_post1 = self.kwargs['list_post']
        list_post1 = Post.objects.filter(topic_id=self.kwargs['pk'])
#        list_post1 = self.list_post
#        # Отбираем первые 10 статей
#        paginator = Paginator(articles, 10)
#        page = self.request.GET.get('page')
#        try:
#            articles = paginator.page(page)
#        except PageNotAnInteger:
#            # If page is not an integer, deliver first page.
#            articles = paginator.page(1)
#        except EmptyPage:
#            # If page is out of range (e.g. 9999), deliver last page of results.
#            articles = paginator.page(paginator.num_pages)
#        return Post.objects.filter(topic_id)#)=self.kwargs['pk'])
        return list_post1



class ForumDetailView(generic.DetailView):
    model = Forum
    template_name = 'forum_detail.html'
    paginate_by = 5
    def get_context_data(self, **kwargs):
        context = super(ForumDetailView, self).get_context_data(**kwargs)
        context['num_topic_for_forum'] = Topic.objects.filter(forum_id=self.kwargs['pk']).count()
        context['list_topic'] = Topic.objects.filter(forum_id=self.kwargs['pk'])
        return context


    def get_context_data(self, **kwargs):
        context = super(ForumDetailView, self).get_context_data(**kwargs)
        context['num_topic_for_forum'] = Topic.objects.filter(forum_id=self.kwargs['pk']).count()
        context['list_topic'] = Topic.objects.filter(forum_id=self.kwargs['pk'])
        context['paginator'] = Paginator('list_topic', 3)
        context['page'] = self.request.GET.get('page')
        try:
            list_topic = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            list_topic = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            list_topic = paginator.page(paginator.num_pages)
        return context



class ForumDetailView(generic.DetailView):
    model = Forum
    template_name = 'forum_detail.html'
    paginate_by = 5
    def get_context_data(self, **kwargs):
        context = super(ForumDetailView, self).get_context_data(**kwargs)
        context['num_topic_for_forum'] = Topic.objects.filter(forum_id=self.kwargs['pk']).count()
#        context['list_topic'] = Topic.objects.filter(forum_id=self.kwargs['pk'])
        list_topic = Topic.objects.filter(forum_id=self.kwargs['pk'])
        paginator = Paginator(list_topic, 3)
        page = self.request.GET.get('page')
        try:
            context['list_topic'] = paginator.page(page)
        except PageNotAnInteger:
            # If page is not an integer, deliver first page.
            context['list_topic'] = paginator.page(1)
        except EmptyPage:
            # If page is out of range (e.g. 9999), deliver last page of results.
            context['list_topic'] = paginator.page(paginator.num_pages)
        return context


# -*- coding: utf-8 -*-
from .forms import PostForm
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

def post_add(request, topic_id):
    form = PostForm()
    topic = Topic.objects.get(pk=topic_id)
    if request.method == "POST":
        form = PostForm(request.POST)
        if form.is_valid():
#            post = Post()
#            post.topic = topic
            post = form.save(commit=False)
            post.topic = topic
            post.creator = request.user
            post.save()
#        return redirect('topic_detail', pk=post.pk)
            return HttpResponseRedirect(reverse('topic_detail', args=(topic.id, )))

    return render(request, 'post_add.html', {'form': form})



from django.views.generic.base import TemplateView, ContextMixin
#from django.views.generic.edit import DeleteView
from django.core.urlresolvers import reverse
from django.shortcuts import redirect

class PostCreate(generic.DetailView):
    template_name = 'post_add.html'
    topic = None
    form = None
#  formset = None

    def get(self, request, *args, **kwargs):
        self.topic = Post.objects.get(pk=self.kwargs['pk'])
        self.form = PostForm(initial={'topic': self.topic})
#    self.formset = GoodImagesFormset()
        return super(PostCreate, self).get(request, *args, **kwargs)


    def get_context_data(self, **kwargs):
        context = super(PostCreate, self).get_context_data(**kwargs)
#        context['topic'] = Post.objects.get(pk=self.kwargs['pk'])
#        topic = Topic.objects.get(pk=topic_id)
        context['topic'] = self.topic
        context['form'] = self.form
#    context["formset"] = self.formset
        return context



    def post(self, request, *args, **kwargs):
        self.form = PostForm(request.POST)#, request.FILES)
        if self.form.is_valid():
            post_add = self.form.save()
#      self.formset = GoodImagesFormset(request.POST, request.FILES, instance = new_good)
#      if self.formset.is_valid():
#        self.formset.save()
#        messages.add_message(request, messages.SUCCESS, "Товар успешно добавлен")
            return redirect(reverse('topic_detail', kwargs = {'pk': post_add.topic.pk}))
#        return HttpResponseRedirect(reverse('topic_detail', args=(topic.id, )))
#    if self.kwargs["pk"] == None:
#      self.cat = Category.objects.first()
#    else:
#      self.cat = Category.objects.get(pk = self.kwargs["pk"])
#    self.formset = GoodImagesFormset(request.POST, request.FILES)
        return super(PostCreate, self).get(request, *args, **kwargs)



class PostCreate(CreateView):
    model=Post
    template_name = 'post_add.html'
    sucess_url='/'
#    topic = None
#    form = None

    def get(self, request, *args, **kwargs):
        self.initial['topic']=Topic.objects.get(pk=self.kwargs['pk'])
        return super(PostCreate, self).get(request, *args, **kwargs)

#    def post(self, request, *args, **kwargs):
#        self.sucess_url = reverse('/')#topic_detail.html', kwargs={'topic_id': Topic.objects.get(pk=self.kwargs['topic_id'].id})
#        return super(PostCreate, self).get(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(PostCreate, self).get_context_data(**kwargs)
        context['topic'] = Topic.objects.get(pk=self.kwargs['pk'])
        return context


    def post(self, request, *args, **kwargs):
        self.form = PostForm(request.POST)
        if self.form.is_valid():
            post_add = self.form.save()
            return redirect(reverse('topic_detail', kwargs = {'pk': post_add.topic.pk}))
        return super(PostCreate, self).get(request, *args, **kwargs)


#        self.topic = Post.objects.get(pk=self.kwargs['pk'])
#        self.form = PostForm(initial={'topic': self.topic})
#        return super(PostCreate, self).get(request, *args, **kwargs)







def get_post_form(request, topic):
    if request.user.is_authenticated():
        instance = Post(topic=topic, user=request.user)
        form = PostForm(request.POST or None, instance=instance)
        return form
    else:
        return None

def post_add(request):
    topic_id = request.GET.get('topic')
    topic = get_object_or_404(Topic, pk=topic_id)
    form = get_post_form(request, topic)
    if form.is_valid():
        form.save()
        return redirect(topic)
    context = {'form': form,
               'topic': topic,
            }
    return render(request, 'post_add.html', context)



    #from django.views.generic.edit import CreateView
#from django.views.generic.edit import ProcessFormView
from django.core.urlresolvers import reverse
from django.shortcuts import redirect, get_object_or_404
from .forms import PostForm
from django.http import HttpResponseRedirect




def post_add(request):
    topic_id = request.GET.get('topic')
    topic = get_object_or_404(Topic, pk=topic_id)
    form = PostForm()
#    topic = Topic.objects.get(pk=topic_id)
    if request.method == "POST":
        form = PostForm(request.POST, topic)
        if form.is_valid():
#            post = Post()
#            post.topic = topic
            post = form.save(commit=False)
            post.topic = topic
            post.creator = request.user
            post.save()
#        return redirect('topic_detail', pk=post.pk)
            return HttpResponseRedirect(reverse('topic_detail', args=(topic)))

    return render(request, 'post_add.html', {'form': form})