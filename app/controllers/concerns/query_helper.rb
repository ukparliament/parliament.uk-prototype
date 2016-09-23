module QueryHelper
  require 'net/http'

  def get_data(uri)
    respond_to do |format|
      format.html {
        json_request_uri = "#{uri}.json"
        ttl_request_uri = "#{uri}.ttl"
        ttl_data = query(ttl_request_uri)
        graph = create_graph(ttl_data)
        json = query(json_request_uri)

        { graph: graph, json: json }
      }
      format.any(:xml, :json, :ttl) {
        request_uri = "#{uri}.#{request.format.to_sym.to_s}"
        data = query(request_uri)
        request.format.to_sym == :ttl ? create_graph(data) : data
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
        data.each_statement do |statement|
          result << RDF::NTriples::Writer.serialize(statement)
        end

        render :text => result
      }
    end
  end

  def create_graph(ttl_data)
    RDF::NTriples::Reader.new(ttl_data) do |reader|
      reader.each_statement do |statement|
        RDF::Graph.new << statement
      end
    end
  end

end