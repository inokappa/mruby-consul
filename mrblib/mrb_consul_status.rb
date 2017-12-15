class Consul
  class Status
    def initialize(config)
      @host = config[:host]
      @port = config[:port].to_s
      @url = "http://" + @host + ":" + @port + "/v1/status/"
      @http = ::HttpRequest.new()
    end

    def leader
      @http.get(@url + "leader")
    end

    def peers
      @http.get(@url + "peers")
    end
  end
end
