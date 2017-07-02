module Parliaments
  module Houses
    class MembersController < ApplicationController
      before_action :data_check, :build_request

      ROUTE_MAP = {
        index:   proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]).members },
        a_to_z:  proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]).members },
        letters: proc { |params| ParliamentHelper.parliament_request.parliaments(params[:parliament_id]).houses(params[:house_id]).members(params[:letter]) }
      }.freeze

      def index
        @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
          @request,
          'http://id.ukpds.org/schema/ParliamentPeriod',
          'http://id.ukpds.org/schema/House',
          'http://id.ukpds.org/schema/Person',
          ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @people     = @people.sort_by(:sort_name)
        @letters    = @letters.map(&:value)
      end

      def a_to_z
        @parliament, @house, @letters = RequestHelper.filter_response_data(
          @request,
          'http://id.ukpds.org/schema/ParliamentPeriod',
          'http://id.ukpds.org/schema/House',
          ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @letters    = @letters.map(&:value)
      end

      def letters
        @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
          @request,
          'http://id.ukpds.org/schema/ParliamentPeriod',
          'http://id.ukpds.org/schema/House',
          'http://id.ukpds.org/schema/Person',
          ::Grom::Node::BLANK
        )

        @parliament = @parliament.first
        @house      = @house.first
        @people     = @people.sort_by(:sort_name)
        @letters    = @letters.map(&:value)
      end
    end
  end
end
