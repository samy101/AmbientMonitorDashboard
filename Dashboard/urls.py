from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'Dashboard.views.index', name='index'),
    url(r'^getdata/(?P<uuid>[a-zA-Z0-9_-]{36})/(?P<starttime>\d{13})/$', 'Dashboard.views.getdata', name='getadta'),
 
   # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
)
