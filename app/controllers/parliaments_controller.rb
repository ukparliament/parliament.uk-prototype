class ParliamentsController < ApplicationController
  def index
    @parliaments = parliament_request.parliaments.get.reverse_sort_by(:number)
  end

  def current
    @parliament = parliament_request.parliaments.current.get.filter('http://id.ukpds.org/schema/ParliamentPeriod').first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def next
    @parliament = parliament_request.parliaments.next.get.filter('http://id.ukpds.org/schema/ParliamentPeriod').first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def previous
    @parliament = parliament_request.parliaments.previous.get.filter('http://id.ukpds.org/schema/ParliamentPeriod').first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def lookup
    source = params[:source]
    id = params[:id]

    @parliament = parliament_request.parliaments.lookup(source, id).get.first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def show
    parliament_id = params[:parliament_id]

    @parliament, @parties = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party'
    )

    @parliament = @parliament.first
    @parties    = @parties.sort_by(:name)
  end

  def next_parliament
    parliament_id = params[:parliament_id]

    @parliament = parliament_request.parliaments(parliament_id).next.get.filter('http://id.ukpds.org/schema/ParliamentPeriod').first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def previous_parliament
    parliament_id = params[:parliament_id]

    @parliament = parliament_request.parliaments(parliament_id).previous.get.filter('http://id.ukpds.org/schema/ParliamentPeriod').first

    redirect_to parliament_path(@parliament.graph_id)
  end

  def members
    parliament_id = params[:parliament_id]

    @parliament, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @people     = @people.sort_by(:sort_name)
    @letters    = @letters.map(&:value)
  end

  def members_letters
    parliament_id = params[:parliament_id]
    letter = params[:letter]

    @parliament, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).members(letter),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @letters    = @letters.map(&:value)
    @people     = @people.sort_by(:sort_name)
  end

  def a_to_z_members
    parliament_id = params[:parliament_id]

    @parliament, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @letters    = @letters.map(&:value)
  end

  def parties
    parliament_id = params[:parliament_id]

    @parliament, @parties = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).parties,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party'
    )

    @parliament = @parliament.first
    @parties = @parties.multi_direction_sort({ member_count: :desc, name: :asc })
  end

  def party
    parliament_id = params[:parliament_id]
    party_id      = params[:party_id]

    @parliament, @party = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).parties(party_id),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party'
    )

    fail ActionController::RoutingError, 'Not Found' if @party.empty?

    @parliament = @parliament.first
    @party      = @party.first
  end

  def party_members
    parliament_id = params[:parliament_id]
    party_id      = params[:party_id]

    @parliament, @party, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).parties(party_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @party      = @party.first
    @people     = @people.sort_by(:sort_name)
    @letters    = @letters.map(&:value)
  end

  def a_to_z_party_members
    parliament_id = params[:parliament_id]
    party_id      = params[:party_id]

    @parliament, @party, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).parties(party_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @party      = @party.first
    @letters    = @letters.map(&:value)
  end

  def party_members_letters
    parliament_id = params[:parliament_id]
    party_id      = params[:party_id]
    letter        = params[:letter]

    @parliament, @party, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).parties(party_id).members(letter),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @party      = @party.first
    @people     = @people.sort_by(:sort_name)
    @letters    = @letters.map(&:value)
  end

  def houses
    parliament_id = params[:parliament_id]

    @parliament, @houses = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House'
    )

    @parliament = @parliament.first
    @houses     = @houses.sort_by(:name)
  end

  def house
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]

    @parliament, @house = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House'
    )

    fail ActionController::RoutingError, 'Not Found' if @house.empty?

    @parliament = @parliament.first
    @house      = @house.first
  end

  def house_members
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]

    @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).members,
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

  def a_to_z_house_members
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]

    @parliament, @house, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @house      = @house.first
    @letters    = @letters.map(&:value)
  end

  def house_members_letters
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]
    letter        = params[:letter]

    @parliament, @house, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).members(letter),
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

  def house_parties
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
    @parties    = @parties.sort_by(:name)
    @letters    = @letters.map(&:values)
  end

  def house_party
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

  def house_party_members
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]
    party_id      = params[:party_id]

    @parliament, @house, @party, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).parties(party_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House',
      'http://id.ukpds.org/schema/Party',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @house      = @house.first
    @party      = @party.first
    @people     = @people.sort_by(:sort_name)
    @letters    = @letters.map(&:value)
  end

  def a_to_z_house_party_members
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]
    party_id      = params[:party_id]

    @parliament, @house, @party, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).parties(party_id).members,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House',
      'http://id.ukpds.org/schema/Party',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @house      = @house.first
    @party      = @party.first
    @letters    = @letters.map(&:value)
  end

  def house_party_members_letters
    parliament_id = params[:parliament_id]
    house_id      = params[:house_id]
    party_id      = params[:party_id]
    letter        = params[:letter]

    @parliament, @house, @party, @people, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).houses(house_id).parties(party_id).members(letter),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/House',
      'http://id.ukpds.org/schema/Party',
      'http://id.ukpds.org/schema/Person',
      ::Grom::Node::BLANK
    )

    @parliament = @parliament.first
    @house      = @house.first
    @party      = @party.first
    @people     = @people.sort_by(:sort_name)
    @letters    = @letters.map(&:value)
  end

  def constituencies
    parliament_id = params[:parliament_id]

    @parliament, @constituencies, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).constituencies,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/ConstituencyGroup',
      ::Grom::Node::BLANK
    )

    @parliament     = @parliament.first
    @constituencies = @constituencies.sort_by(:name)
    @letters        = @letters.map(&:value)
  end

  def a_to_z_constituencies
    parliament_id = params[:parliament_id]

    @parliament, @constituencies, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).constituencies,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/ConstituencyGroup',
      ::Grom::Node::BLANK
    )

    @parliament     = @parliament.first
    @constituencies = @constituencies.sort_by(:name)
    @letters        = @letters.map(&:value)
  end

  def constituencies_letters
    parliament_id = params[:parliament_id]
    letter        = params[:letter]

    @parliament, @constituencies, @letters = RequestHelper.filter_response_data(
      parliament_request.parliaments(parliament_id).constituencies(letter),
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/ConstituencyGroup',
      ::Grom::Node::BLANK
    )

    @parliament     = @parliament.first
    @constituencies = @constituencies.sort_by(:name)
    @letters        = @letters.map(&:value)
  end
end
