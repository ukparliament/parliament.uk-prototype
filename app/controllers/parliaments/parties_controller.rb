module Parliaments
  class PartiesController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index: proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).parties },
      show:  proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).parties(params[:party_id]) }
    }.freeze

    def index
      @parliament, @parties = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/Party'
      )

      @parliament = @parliament.first
      @parties = @parties.multi_direction_sort({ member_count: :desc, name: :asc })
    end

    def show
      @parliament, @party = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/Party'
      )

      raise ActionController::RoutingError, 'Not Found' if @party.empty?

      @parliament = @parliament.first
      @party      = @party.first
    end
  end
end
