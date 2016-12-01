class PartiesController < ApplicationController

  def index
    @parties = Party.all

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

    format({ serialized_data: { party: @party, members: @members } })
  end

  def current_members
    @party = Party.find(params[:party_id])
    @members = @party.members('current')

    format({ serialized_data: { party: @party, members: @members } })
  end
end
