# -*- coding: utf-8 -*-
# A DetailView of a User can have a paginated list of Purchases
# In the template, the pagination needs to done similar to the following example:
# {% bootstrap_pagination purchases_page_obj extra=request.GET.urlencode parameter_name="purchases_page" %}

from django.views.generic.detail import DetailView
from django.core import paginator

@method_decorator(staff_member_required(login_url='user_login'), name='dispatch')
class UserDetailView(DetailView):
    model = User
    template_name = "barsys/userarea/user_detail.html"
    purchases_paginate_by = 5

    def get_context_data(self, **kwargs):
        context = super(UserDetailView, self).get_context_data(**kwargs)

        purchases_page = self.request.GET.get("purchases_page")
        purchases = self.object.get_purchases().filter()
        purchases_paginator = paginator.Paginator(purchases, self.purchases_paginate_by)
        # Catch invalid page numbers
        try:
            purchases_page_obj = purchases_paginator.page(purchases_page)
        except (paginator.PageNotAnInteger, paginator.EmptyPage):
            purchases_page_obj = purchases_paginator.page(1)

        context["purchases_page_obj"] = purchases_page_obj
        return context