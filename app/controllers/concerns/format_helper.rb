module FormatHelper

  def format(data)
    respond_to do |format|
      format.html
      format.any(:xml, :json) { render request.format.to_sym => data[:serialized_data] }
      format.ttl {
        result = ""
        data[:graph_data].each_statement do |statement|
          result << RDF::NTriples::Writer.serialize(statement)
        end
        render :text => result
      }
    end
  end

end