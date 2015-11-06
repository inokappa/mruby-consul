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
  # endpoint: node / checks / service / state
  # args: node / service / state
  #
  def health(endpoint, args={})
    url = "http://" + @host + ":" + @port + "/v1/health/" 
    case endpoint
    when "node" then
      url = url + endpoint + "/" + args[:node]
    when "checks" then
      url = url + endpoint + "/" + args[:service]
    when "service" then
      url = url + endpoint + "/" + args[:service]
    when "state" then
      url = url + endpoint + "/" + args[:state]
    else
      puts "Please set Request method(get or put or del)"
      exit 1
    end
    access("get", url)
  end

  #
  # endpoint: leader / peers
  #
  def status(endpoint)
    url = "http://" + @host + ":" + @port + "/v1/status/" 
    case endpoint
    when "leader" then
      url = url + endpoint + "/"
    when "peers" then
      url = url + endpoint + "/"
    end
    access("get", url)
  end
  #
  # access
  #
  def access(req_method, url, args={})
    puts url
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
