module QueryHelper
  require 'net/http'

  def get_data(uri)
    respond_to do |format|
      request_uri = "#{uri}.#{format}"
    end
    Net::HTTP.get(URI(request_uri))
  end

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json, :ttl) { render request.format.to_sym => response }
    end
  end
end