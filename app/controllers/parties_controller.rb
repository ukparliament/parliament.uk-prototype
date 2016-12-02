class PartiesController < ApplicationController

  def index
    @parties = Party.all
    @parties.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    format({ serialized_data: @parties })
  end

  def current
    @parties = Party.all('current')

    format({ serialized_data: @parties })
  end

  def show
    @party = Party.find(params[:id])

    format({ serialized_data: @party })
  end

  def members
    @party = Party.find(params[:party_id])
    @members = @party.members
    @members.sort! { |a,b| a.surname.downcase <=> b.surname.downcase }

    format({ serialized_data: { party: @party, members: @members } })
  end

  def current_members
    @party = Party.find(params[:party_id])
    @members = @party.members('current')

    format({ serialized_data: { party: @party, members: @members } })
  end
end
