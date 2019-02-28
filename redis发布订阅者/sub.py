import redis

conn = redis.Redis(host="127.0.0.1", port=6379, decode_responses=True)

# 第一步 生成一个订阅者对象
pubsub = conn.pubsub()

# 第二步 订阅一个消息

pubsub.subscribe("lewen")

# 创建一个接收

while True:
    print("working~~~")
    msg = pubsub.parse_response()
    print(msg)  # 默认值是1

# 只要订阅的内容发布改变，就会更新所有
