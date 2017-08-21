module Parties
  class MembersController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:           proc { |params| ParliamentHelper.parliament_request.party_members.set_url_params({ party_id: params[:party_id] }) },
      current:         proc { |params| ParliamentHelper.parliament_request.party_current_members.set_url_params({ party_id: params[:party_id] }) },
      letters:         proc { |params| ParliamentHelper.parliament_request.party_members_by_initial.set_url_params({ party_id: params[:party_id], initial: params[:letter] }) },
      current_letters: proc { |params| ParliamentHelper.parliament_request.party_current_members_by_initial.set_url_params({ party_id: params[:party_id], initial: params[:letter] }) },
      a_to_z:          proc { |params| ParliamentHelper.parliament_request.party_members_a_to_z.set_url_params({ party_id: params[:party_id] }) },
      a_to_z_current:  proc { |params| ParliamentHelper.parliament_request.party_current_members_a_to_z.set_url_params({ party_id: params[:party_id] }) }
    }.freeze

    def index
      @party, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Party',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @party = @party.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
    end

    def current
      @party, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Party',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @party = @party.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
    end

    def letters
      @party, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Party',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @party = @party.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
    end

    def current_letters
      @party, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/Party',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @party = @party.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
    end

    def a_to_z
      @party_id = params[:party_id]
      @letters = RequestHelper.process_available_letters(@request)
    end

    def a_to_z_current
      @party_id = params[:party_id]
      @letters = RequestHelper.process_available_letters(@request)
    end
  end
end
