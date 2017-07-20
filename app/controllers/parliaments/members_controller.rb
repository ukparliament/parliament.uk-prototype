module Parliaments
  class MembersController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:   proc { |params| ParliamentHelper.parliament_request.parliament_members.set_url_params({ parliament_id: params[:parliament_id] }) },
      a_to_z:   proc { |params| ParliamentHelper.parliament_request.parliament_members.set_url_params({ parliament_id: params[:parliament_id] }) },
      letters: proc { |params| ParliamentHelper.parliament_request.parliament_members_by_initial.set_url_params({ parliament_id: params[:parliament_id], initial: params[:letter] }) }

      # Currently, a_to_z renders the same data as index, so this is reflected in the api request
      # But a route does exist for it in the Data API
      # a_to_z:  proc { |params| ParliamentHelper.parliament_request.parliament_members_a_to_z.set_url_params({ parliament_id: params[:parliament_id] }) },
    }.freeze

    def index
      @parliament, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @parliament = @parliament.first
      @people     = @people.sort_by(:sort_name)
      @letters    = @letters.map(&:value)
    end

    def letters
      @parliament, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @parliament = @parliament.first
      @letters    = @letters.map(&:value)
      @people     = @people.sort_by(:sort_name)
    end

    def a_to_z
      @parliament, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/ParliamentPeriod',
        ::Grom::Node::BLANK
      )

      @parliament = @parliament.first
      @letters    = @letters.map(&:value)
    end
  end
end
