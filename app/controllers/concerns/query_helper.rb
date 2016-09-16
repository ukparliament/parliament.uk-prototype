module QueryHelper
  require 'net/http'

  def get_data(uri)
    request_uri = respond_to do |format|
      format.html { "#{uri}.json"}
      format.any(:xml, :json, :ttl) { "#{uri}.#{request.format.to_sym.to_s}" }
    end
    Net::HTTP.get(URI(request_uri))
  end

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json, :ttl) { render request.format.to_sym => data }
    end
  end

end