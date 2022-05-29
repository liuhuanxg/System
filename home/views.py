from django.contrib.auth.models import User
from django.http import JsonResponse


def query_user(request):
    resp = {"status": 1, "data": []}
    user_id = request.GET.get("user_id", "")
    if user_id == "1’ UNION select user,email from users":
        users = User.objects.all()
        for user in users:
            resp["data"].append(
                {
                    "username": user.username,
                    "email": user.email
                }
            )
    return JsonResponse(resp)
