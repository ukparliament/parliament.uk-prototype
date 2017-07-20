module People
  class ContactPointsController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index: proc { |params| ParliamentHelper.parliament_request.person_contact_points.set_url_params({ person_id: params[:person_id] }) }
    }.freeze

    def index
      @person, @contact_points = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Person',
        'http://id.ukpds.org/schema/ContactPoint'
      )

      @person = @person.first
    end
  end
end
