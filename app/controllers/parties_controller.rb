class PartiesController < ApplicationController

  def index
    @parties = order_list(Party.all, :name)

    format({ serialized_data: @parties })
  end

  def current
    @parties = order_list(Party.all('current'), :name)

    format({ serialized_data: @parties })
  end

  def show
    @party = Party.find(params[:id])

    format({ serialized_data: @party })
  end

  def members
    @party = Party.find(params[:party_id])
    @members = order_list(@party.members, :surname, :forename)

    format({ serialized_data: { party: @party, members: @members } })
  end

  def current_members
    @party = Party.find(params[:party_id])
    @members = order_list(@party.members('current'), :surname, :forename)

    format({ serialized_data: { party: @party, members: @members } })
  end

  def letters
    letter = params[:letter]
    @parties = order_list(Party.all(letter), :partyName)

    format({ serialized_data: @parties })

    render "index"
  end
end
