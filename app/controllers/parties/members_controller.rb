module Parties
  class MembersController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:           proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members },
      current:         proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members.current },
      letters:         proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members(params[:letter]) },
      current_letters: proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members.current(params[:letter]) },
      a_to_z:          proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members.a_z_letters },
      a_to_z_current:  proc { |params| ParliamentHelper.parliament_request.parties(params[:party_id]).members.current.a_z_letters }
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
