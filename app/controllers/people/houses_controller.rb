module People
  class HousesController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:   proc { |params| ParliamentHelper.parliament_request.person_houses.set_url_params({ person_id: params[:person_id] }) },
      current: proc { |params| ParliamentHelper.parliament_request.person_current_house.set_url_params({ person_id: params[:person_id] }) }
    }.freeze

    def index
      @person, @incumbencies = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Person',
        'http://id.ukpds.org/schema/Incumbency'
      )

      @person = @person.first
      @incumbencies = @incumbencies.reverse_sort_by(:start_date)
    end

    def current
      @person, @house = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Person',
        'http://id.ukpds.org/schema/House'
      )

      @person = @person.first
      @house = @house.first
    end
  end
end
