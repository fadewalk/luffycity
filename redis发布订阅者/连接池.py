
import redis

# 保持跟数据库的链接,当超过数量时，就等着
#                                                         # 解码
pool = redis.ConnectionPool(host="127.0.0.1", port=6379, decode_responses=True, max_connections=10)

conn = redis.Redis(connection_pool=pool)

ret = conn.get("n1")
print(ret)
