require 'net/http'

module Fetcher

  def get_template(template_name)
    uri = URI("#{MembersPrototype::Application.config.assets_endpoint}/components/#{template_name}")
    Net::HTTP.get(uri)
  end

end
