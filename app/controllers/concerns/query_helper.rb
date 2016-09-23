module QueryHelper
  require 'net/http'

  def get_data(uri)
    respond_to do |format|
      format.html {
        json_request_uri = "#{uri}.json"
        ttl_request_uri = "#{uri}.ttl"
        graph = query(ttl_request_uri)
        json = query(json_request_uri)

        { graph: graph, json: json }
      }
      format.any(:xml, :json, :ttl) {
        request_uri = "#{uri}.#{request.format.to_sym.to_s}"
        query(request_uri)
      }
    end
  end

  def query(uri)
    Net::HTTP.get(URI(uri))
  end

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => data }
      format.ttl {
        result = ""
        RDF::Reader.for(:ntriples).new(data) do |reader|
          reader.each_statement do |statement|
            result << RDF::NTriples::Writer.serialize(statement)
          end
        end

        render :text => result
      }
    end
  end

end