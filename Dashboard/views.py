from django.http import HttpResponse
from django.shortcuts import render
from django.template import RequestContext, loader
import urllib2
import simplejson as json

def index(request):
    template = loader.get_template('index.html')
    # return HttpResponse("Hello, world. You're at the polls index.")
    return render(request, 'index.html')

def getdata(request,uuid,starttime):
    print uuid, starttime
    # print type(uuid), type(starttime)
    uuid = uuid.encode('ascii', 'ignore')
    starttime = starttime.encode('ascii', 'ignore')
    # print type(uuid), type(starttime)

    data = ""
    try:
    	smap_url = "http://energy.iiitd.edu.in:9202/backend/api/data/uuid/"+uuid+"?starttime="+starttime+"&direction=next&limit=10000"
    	print 'Invoking ' + smap_url
 	data = urllib2.urlopen(smap_url).read()
 	print 'data ' + data
    except Exception, e:
     	print 'Exception: %s' % e 
	data = e

    # parse the output
    # [{"uuid": "8018be88-3fed-5c24-a352-8f3a12c603a6", "Readings": [[1401895583000.0, 29.5], [1401895588000.0, 29.5]]}]

    return HttpResponse(data)
    #return render(request, 'index.html')

