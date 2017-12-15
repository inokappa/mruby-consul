class Consul
  class Health
    def initialize(config)
      @host = config[:host]
      @port = config[:port].to_s
      @url = "http://" + @host + ":" + @port + "/v1/health/"
      @http = ::HttpRequest.new()
    end
    def node(node)
      @http.get(@url + "node/" + node)
    end
    def checks(check)
      @http.get(@url + "checks/" + check)
    end
    def service(service)
      @http.get(@url + "service/" + service)
    end
    def state(state)
      @http.get(@url + "state/" + state)
    end
  end
end
