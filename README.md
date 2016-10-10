Background processing

Gems:

```
https://github.com/mperham/sidekiq
https://github.com/deivid-rodriguez/byebug
```

Redis
```
http://redis.io/
http://jasdeep.ca/2012/05/installing-redis-on-mac-os-x/
sudo apt-get -y install redis-server
```

Connect to Redis
```
redis-cli
```


Changes:
```
workers/image.rb
config/initializers/03-sidekique_initializer.rb
config/sidekiq.yml
app.rb:10
app.rb:12
app.rb:38
config.ru
Gemfile:15
Gemfile:16
.env:6-9
```

To start processing:

```
sidekiq -r ./workers/image.rb  -C config/sidekiq.yaml
```

To see web console:
```
http://localhost:9393/sidekiq
```

TODO:
Implement background processing for images
