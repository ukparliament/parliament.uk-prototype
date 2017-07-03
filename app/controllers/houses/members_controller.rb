module Houses
  class MembersController < ApplicationController
    before_action :data_check, :build_request

    ROUTE_MAP = {
      index:           proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members },
      a_to_z_current:  proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members.current.a_z_letters },
      current:         proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members.current },
      letters:         proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members(params[:letter]) },
      current_letters: proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members.current(params[:letter]) },
      a_to_z:          proc { |params| ParliamentHelper.parliament_request.houses(params[:house_id]).members.a_z_letters }
    }.freeze

    def index
      @house, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @house = @house.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)

      @current_person_type, @other_person_type = HousesHelper.person_type_string(@house)
      @current_house_id, @other_house_id = HousesHelper.house_id_string(@house)
    end

    def current
      @house, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @house = @house.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)

      @current_person_type, @other_person_type = HousesHelper.person_type_string(@house)
      @current_house_id, @other_house_id = HousesHelper.house_id_string(@house)
    end

    def letters
      @house, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @house = @house.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
      @current_person_type, @other_person_type = HousesHelper.person_type_string(@house)
      @current_house_id, @other_house_id = HousesHelper.house_id_string(@house)
    end

    def current_letters
      @house, @people, @letters = RequestHelper.filter_response_data(
        @request,
        'http://id.ukpds.org/schema/House',
        'http://id.ukpds.org/schema/Person',
        ::Grom::Node::BLANK
      )

      @house = @house.first
      @people = @people.sort_by(:sort_name)
      @letters = @letters.map(&:value)
      @current_person_type, @other_person_type = HousesHelper.person_type_string(@house)
      @current_house_id, @other_house_id = HousesHelper.house_id_string(@house)
    end

    def a_to_z
      @house_id = params[:house_id]

      @letters = RequestHelper.process_available_letters(@request)
    end

    def a_to_z_current
      @house_id = params[:house_id]

      @letters = RequestHelper.process_available_letters(@request)
    end
  end
end
