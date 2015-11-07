class Http
  def initialize
    @http = HttpRequest.new()
  end
  def http_get(url)
    @http.get(url)
  end
  def http_put(url, value)
    @http.put(url, value)
  end
  def http_delete(url)
    @http.delete(url)
  end
end
