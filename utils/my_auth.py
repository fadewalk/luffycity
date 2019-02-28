import redis

from rest_framework.authentication import BaseAuthentication
from rest_framework.exceptions import AuthenticationFailed

from .redis_pool import POOL
from Course.models import Account

CONN = redis.Redis(connection_pool=POOL)


class LoginAuth(BaseAuthentication):
    def authenticate(self, request):
        # 从请求头中获取前端带过来的token。或者跟前端商量好
        token = request.META.get("HTTP_AUTHENTICATION", "")
        print(request.META)
        print(token)
        if not token:
            raise AuthenticationFailed("没有携带token")
        # 去redis比对
        user_id = CONN.get(str(token))  # get没有的值返回 None
        if user_id == None:
            raise AuthenticationFailed("token过期")  # 重新登录设置token
        user_obj = Account.objects.filter(id=user_id).first()
        return user_obj, token
