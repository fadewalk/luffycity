# by gaoxin


class BaseResponse(object):
    """
    封装响应的类
    """
    def __init__(self):
        self.code = 1000
        self.data = None
        self.error = None


    @property
    def dict(self):
        return self.__dict__        # 返回字典