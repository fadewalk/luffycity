
from django.urls import path
from .views import CategoryView, CourseView, CourseDetailView, CourseChapterView, CourseCommentView, QuestionView
from .video_view import PolyvView


urlpatterns = [
    # 课程分类
    path('category', CategoryView.as_view()),

    # 课程
    path('list', CourseView.as_view()),

    #               课程id
    path('detail/<int:pk>', CourseDetailView.as_view()),

    # 课程的章节接口  课程id
    path('chapter/<int:pk>', CourseChapterView.as_view()),

    #  评论         课程id
    path('comment/<int:pk>', CourseCommentView.as_view()),
    
    path('question/<int:pk>', QuestionView.as_view()),

    path('polyv', PolyvView.as_view()),

]