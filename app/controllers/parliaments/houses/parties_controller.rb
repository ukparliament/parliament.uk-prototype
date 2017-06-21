module Parliaments
  module Houses
    class PartiesController < ApplicationController
      def index
        parliament_id = params[:parliament_id]
        house_id      = params[:house_id]

        @parliament, @house, @parties, @letters = RequestHelper.filter_response_data(
        parliament_request.parliaments(parliament_id).houses(house_id).parties,
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
        parliament_id = params[:parliament_id]
        house_id      = params[:house_id]
        party_id      = params[:party_id]

        @parliament, @house, @party = RequestHelper.filter_response_data(
        parliament_request.parliaments(parliament_id).houses(house_id).parties(party_id),
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Party'
        )

        fail ActionController::RoutingError, 'Not Found' if @party.empty?

        @parliament = @parliament.first
        @house      = @house.first
        @party      = @party.first
      end
    end
  end
end
