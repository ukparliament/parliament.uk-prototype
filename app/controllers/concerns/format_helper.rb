module QueryHelper
  require 'net/http'

  def get_data(uri)
    respond_to do |format|
      request_uri = "#{endpoint}.#{format}"
    end
    Net::HTTP.get(URI(request_uri))
  end

  def format(endpoint)
    respond_to do |format|
      request_uri = "#{endpoint}.#{format}"
      response = Net::HTTP.get(URI(request_uri))
      format.html
      format.any(:xml, :json, :ttl) { render request.format.to_sym => response }
    end
  end
end