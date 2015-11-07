# mruby-consul   [![Build Status](https://travis-ci.org/inokappa/mruby-consul.png?branch=master)](https://travis-ci.org/inokappa/mruby-consul)
## install by mrbgems

- add conf.gem line to `build_config.rb`

```ruby
MRuby::Build.new do |conf|

    # ... (snip) ...

    conf.gem :github => 'inokappa/mruby-consul'
end
```

***

## supported endpoint

- [KV](https://www.consul.io/docs/agent/http/kv.html)
- [Health Check](https://www.consul.io/docs/agent/http/health.html)
- [Status](https://www.consul.io/docs/agent/http/status.html)

***

## example(1)

### Run Consul

```
$ cat /etc/consul.d/default.json
{
  "server": true,
  "bootstrap_expect": 1,
  "log_level": "INFO",
  "node_name": "localhost",
  "data_dir": "/opt/consul",
  "ui_dir": "/opt/consul-ui",
  "client_addr": "0.0.0.0"
}
$ consul agent -config-dir /etc/consul.d &
```

### code

```ruby
config = {
  :host => "127.0.0.1",
  :port => "8500",
}

kv = Consul::Kv.new(config)
puts "put: #{kv.put("foo", "bar")['body']}"
puts "get: #{kv.get("foo")['body']}"
puts "delete: #{kv.del("foo")['body']}"

status = Consul::Status.new(config)
puts "leader: #{status.leader['body']}"
puts "peers: #{status.peers['body']}"

health = Consul::Health.new(config)
puts "node: #{health.node("localhost")['body']}"
puts "checks: #{health.checks("your_service")['body']}"
puts "service: #{health.service("your_service")['body']}"
puts "state: #{health.state("any")['body']}"
```

### output

```sh
put: true
get: [{"CreateIndex":523,"ModifyIndex":523,"LockIndex":0,"Key":"foo","Flags":0,"Value":"YmFy"}]
delete: true
leader: "10.0.2.xx:8300"
peers: ["10.0.2.xx:8300"]
node: [{"Node":"localhost","CheckID":"serfHealth","Name":"Serf Health Status","Status":"passing","Notes":"","Output":"Agent alive and reachable","ServiceID":"","ServiceName":""}]
checks: []
service: []
state: [{"Node":"localhost","CheckID":"serfHealth","Name":"Serf Health Status","Status":"passing","Notes":"","Output":"Agent alive and reachable","ServiceID":"","ServiceName":""}]
```

***

## example(2)

### Referred to

- https://github.com/rrreeeyyy/mruby-raft/blob/master/Dockerfile

Thank you!!!

### Run Consul

```sh
$ cat /etc/consul.d/default.json
{
  "server": true,
  "bootstrap_expect": 1,
  "log_level": "INFO",
  "node_name": "localhost",
  "data_dir": "/opt/consul",
  "ui_dir": "/opt/consul-ui",
  "client_addr": "0.0.0.0"
}
$ consul agent -config-dir /etc/consul.d &
```

### docker build

```sh
$ docker build -t inokappa/mruby-consul .
```

### code

```ruby
config = {
  :host => "${your docker0 IP address}",
  :port => "8500",
}

kv = Consul::Kv.new(config)
puts "put: #{kv.put("foo", "bar")['body']}"
puts "get: #{kv.get("foo")['body']}"
puts "delete: #{kv.del("foo")['body']}"

status = Consul::Status.new(config)
puts "leader: #{status.leader['body']}"
puts "peers: #{status.peers['body']}"

health = Consul::Health.new(config)
puts "node: #{health.node("localhost")['body']}"
puts "checks: #{health.checks("your_service")['body']}"
puts "service: #{health.service("your_service")['body']}"
puts "state: #{health.state("any")['body']}"
```

### docker run

```sh
$ docker run --rm -v `pwd`:/tmp inokappa/mruby-consul /tmp/example/example.rb
```

### output

```sh
put: true
get: [{"CreateIndex":523,"ModifyIndex":523,"LockIndex":0,"Key":"foo","Flags":0,"Value":"YmFy"}]
delete: true
leader: "10.0.2.xx:8300"
peers: ["10.0.2.xx:8300"]
node: [{"Node":"localhost","CheckID":"serfHealth","Name":"Serf Health Status","Status":"passing","Notes":"","Output":"Agent alive and reachable","ServiceID":"","ServiceName":""}]
checks: []
service: []
state: [{"Node":"localhost","CheckID":"serfHealth","Name":"Serf Health Status","Status":"passing","Notes":"","Output":"Agent alive and reachable","ServiceID":"","ServiceName":""}]
```


## License
under the MIT License:
- see LICENSE file
