class ContactPointsController < ApplicationController

  def index
    data = Parliament::Request.new.contact_points.get
    @contact_points = data.filter('http://id.ukpds.org/schema/ContactPoint').first
  end

  def show
    data = Parliament::Request.new.contact_points(params[:id]).get
    @contact_point = data.filter('http://id.ukpds.org/schema/ContactPoint').first.first
    vcard = create_vcard(@contact_point)
    name = @contact_point.person.empty? ? 'contact.vcf' : "#{@contact_point.person.first.given_name}.vcf"
    send_data vcard.to_s, filename: name, disposition: 'attachment', data: { turbolink: false }
  end
end
