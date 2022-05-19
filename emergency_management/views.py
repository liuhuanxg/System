from django.http import HttpResponse, HttpResponseRedirect

from .models import *
def update_status(request, id):
    # print("id:{}".format(id))
    action = int(request.GET.get("action", 1))
    # print("action:{}".format(action))
    res = Message.objects.filter(id=id).update(status=action+1)
    print(res)
    # return HttpResponse("成功")
    return HttpResponseRedirect("/emergency_management/message/")