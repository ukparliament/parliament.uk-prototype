module People
  class ConstituenciesController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:   proc { |params| ParliamentHelper.parliament_request.person_constituencies.set_url_params({ person_id: params[:person_id] }) },
      current: proc { |params| ParliamentHelper.parliament_request.person_current_constituency.set_url_params({ person_id: params[:person_id] }) }
    }.freeze

    def index
      @person, @seat_incumbencies = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Person',
        'http://id.ukpds.org/schema/SeatIncumbency'
      )

      @person = @person.first
      @seat_incumbencies = @seat_incumbencies.reverse_sort_by(:start_date)
    end

    def current
      @person, @constituency = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Person',
        'http://id.ukpds.org/schema/ConstituencyGroup'
      )

      @person = @person.first
      @constituency = @constituency.first
    end
  end
end
