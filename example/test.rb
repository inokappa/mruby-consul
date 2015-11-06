config = {
  :host => "127.0.0.1",
  :port => "8500",
}

consul = Consul.new(config)

# kv: https://www.consul.io/docs/agent/http/kv.html
puts "put: #{consul.kv("put", :key => "foo", :value => "bar")['body']}"
puts "get: #{consul.kv("get", :key => "foo")['body']}"
puts "delete: #{consul.kv("del", :key => "foo")['body']}"

# health: http://www.consul.io/docs/agent/http/health.html 
puts "node: #{consul.health("node", :node => "localhost")['body']}"
puts "node: #{consul.health("checks", :service => "your_service")['body']}"
puts "node: #{consul.health("service", :service => "your_service")['body']}"
puts "node: #{consul.health("state", :state => "any")['body']}"

# status: https://www.consul.io/docs/agent/http/status.html
puts "status: #{consul.status("leader")['body']}"
puts "peers: #{consul.status("peers")['body']}"
