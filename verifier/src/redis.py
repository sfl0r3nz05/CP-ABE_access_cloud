import redis
r = redis.Redis(host='verifier_db', port=6379, db=0)
r.set('foo', 'bar')
r.get('foo')