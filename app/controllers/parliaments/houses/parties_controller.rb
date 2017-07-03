module Parliaments
  module Houses
    class PartiesController < ApplicationController
      before_action :data_check, :build_request

      ROUTE_MAP = {
        index: proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]).parties },
        show:  proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]).parties(params[:party_id]) }
      }.freeze

      def index
        @parliament, @house, @parties, @letters = RequestHelper.filter_response_data(
          @request,
          'http://id.ukpds.org/schema/ParliamentPeriod',
          'http://id.ukpds.org/schema/House',
          'http://id.ukpds.org/schema/Party',
          ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @parties    = @parties = @parties.multi_direction_sort({ member_count: :desc, name: :asc })
        @letters    = @letters.map(&:values)
      end

      def show
        @parliament, @house, @party = RequestHelper.filter_response_data(
          @request,
          'http://id.ukpds.org/schema/ParliamentPeriod',
          'http://id.ukpds.org/schema/House',
          'http://id.ukpds.org/schema/Party'
        )

        raise ActionController::RoutingError, 'Not Found' if @party.empty?

        @parliament = @parliament.first
        @house      = @house.first
        @party      = @party.first
      end
    end
  end
end
