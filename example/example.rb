config = {
  :host => "172.17.0.1",
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
