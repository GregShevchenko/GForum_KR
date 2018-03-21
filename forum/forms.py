# -*- coding: utf-8 -*-
from django import forms
from django.forms import ModelForm
from django.utils.translation import ugettext_lazy as _
#from django.core.exceptions import ValidationError

from .models import Topic, Post

class PostForm(forms.ModelForm):
  class Meta:
    model = Post
    fields = ('title', 'content',)


class TopicForm(forms.ModelForm):
    class Meta:
        model = Topic
        fields = ['title', 'description']
        labels = { 'title': _('Заголовок:'), 'description': _('Первое сообщение:'), }
#    help_texts = { 'due_back': _('Enter a date between now and 4 weeks (default 3).'), }


