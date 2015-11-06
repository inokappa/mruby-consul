class Consul
  def initialize(config)
    @host = config[:host]
    @port = config[:port] 
  end
  #
  # req_method: get / put / delete(del)
  # args: key / value
  #
  def kv(req_method, args={})
    url = "http://" + @host + ":" + @port + "/v1/kv/" + args[:key]
    case req_method
    when "get" then
      access(req_method, url) 
    when "put" then
      access(req_method, url, :val => args[:value])
    when "del" then
      access(req_method, url)
    else
      puts "Please set Request method(get or put or del)"
      exit 1
    end
  end

  #
  # req_type: node / checks / service / state
  # args: node / service / state
  #
  def health(req_type, args={})
    url = "http://" + @host + ":" + @port + "/v1/health/" 
    case req_type
    when "node" then
      url = url + req_type + args[:node]
    when "checks" then
      url = url + req_type + args[:service]
    when "service" then
      url = url + req_type + args[:service]
    when "state" then
      url = url + req_type + args[:state]
    else
      puts "Please set Request method(get or put or del)"
      exit 1
    end
    access("get", url)
  end

  #
  # 
  #
  def access(req_method, url, args={})
    http = HttpRequest.new()
    case req_method
    when "get" then
      http.get(url)
    when "put" then
      http.put(url, args[:val])
    when "del" then
      http.delete(url)
    else
      puts "Please set Request method(get or put or del)"
      exit 1
    end
  end

end
