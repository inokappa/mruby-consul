##
## Consul Test
##

assert("Consul#kv") do
  consul = Consul.new
  assert_equal("hello", consul.kv)
end
