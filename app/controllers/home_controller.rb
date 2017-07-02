class HomeController < ApplicationController
  before_action :disable_top_navigation, :disable_status_banner
  before_action :data_check, :build_request, only: :mps

  ROUTE_MAP = {
    mps: proc { ParliamentHelper.parliament_request.people.mps }
  }.freeze

  def index; end

  def mps
    enable_top_navigation
    enable_status_banner

    @parliaments, @parties, @speaker = RequestHelper.filter_response_data(
      @request,
      'http://id.ukpds.org/schema/ParliamentPeriod',
      'http://id.ukpds.org/schema/Party',
      'http://id.ukpds.org/schema/Person'
    )

    @parties = @parties.multi_direction_sort({ member_count: :desc, name: :asc })
  end
end
