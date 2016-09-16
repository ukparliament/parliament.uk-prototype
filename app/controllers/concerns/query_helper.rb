module QueryHelper
  require 'net/http'

  def get_data(uri)
    request_uri = "#{uri}.#{request.format.to_sym.to_s}"
    Net::HTTP.get(URI(request_uri))
  end

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json, :ttl) { render request.format.to_sym => data }
    end
  end

end