config = {
  :host => "127.0.0.1",
  :port => "8500",
}

consul = Consul.new(config)

#puts consul
puts "put: #{consul.kv("put", :key => "foo", :value => "bar")['body']}"
puts "get: #{consul.kv("get", :key => "foo")['body']}"
puts "delete: #{consul.kv("del", :key => "foo")['body']}"
