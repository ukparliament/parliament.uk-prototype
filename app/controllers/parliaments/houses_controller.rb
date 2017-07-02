module Parliaments
  class HousesController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index: proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses },
      show:  proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]) }
    }.freeze

    def index
      @parliament, @houses = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House'
      )

      @parliament = @parliament.first
      @houses     = @houses.sort_by(:name)
    end

    def show
      @parliament, @house = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House'
      )

      raise ActionController::RoutingError, 'Not Found' if @house.empty?

      @parliament = @parliament.first
      @house      = @house.first
    end
  end
end
