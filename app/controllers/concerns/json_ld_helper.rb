module JSON_LD_Helper
  def json_ld(data)
    json_ld = nil
    JSON::LD::API::fromRDF(data) do |expanded|
      json_ld = JSON::LD::API.compact(expanded, nil)
    end
    json_ld.to_json
  end
end