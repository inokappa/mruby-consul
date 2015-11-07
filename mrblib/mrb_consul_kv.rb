class Consul
  class Kv
    def initialize(config)
      @host = config[:host]
      @port = config[:port] 
      @url = "http://" + @host + ":" + @port + "/v1/kv/"
      @http = HttpRequest.new()
    end
    #
    # req_method: get / put / delete(del)
    # args: key / value
    #
    def get(key, args={})
      @http.get(@url + key)
    end

    def put(key, value, args={})
      @http.put(@url + key, value)
    end

    def del(key, args={})
      @http.delete(@url + key)
    end
  end
end
