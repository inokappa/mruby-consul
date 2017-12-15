##
## Consul Test
##

assert("Consul::Kv") do
  consul = Consul::Kv.new(host: 'localhost', port: 8500)
  assert_equal(Consul::Kv, consul.class)
end
