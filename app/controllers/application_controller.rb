require 'vcard/vcard'
require 'parliament'
require 'houses_helper'
require 'request_helper'
require 'parliament_helper'
require 'format_helper'
require 'pugin/helpers/controller_helpers'

# Base class for all other controllers
class ApplicationController < ActionController::Base
  include VCardHelper
  include Parliament
  include HousesHelper
  include RequestHelper
  include ParliamentHelper
  include ResourceHelper
  include FormatHelper
  include Pugin::Helpers::ControllerHelpers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'pugin/layouts/pugin'

  # Controller helper methods available from Pugin::Helpers::ControllerHelpers
  #
  # Used to turn Pugin Features on and off at a controller level
  before_action :reset_bandiera_features, :enable_top_navigation, :enable_status_banner, :reset_alternates

  # Rescues from a Parliament::ClientError and raises an ActionController::RoutingError
  rescue_from Parliament::ClientError do |error|
    raise ActionController::RoutingError, error.message
  end

  # Rescues from a Parliament::NoContentResponseError and raises an ActionController::RoutingError
  rescue_from Parliament::NoContentResponseError do |error|
    raise ActionController::RoutingError, error.message
  end

  private

  # Before every request, reset Pugin's list of alternates to prevent showing rel-alternate tags on pages without data
  def reset_alternates
    Pugin.alternates = []
  end

  # Before every request that provides data, see if the user is requesting a format that can be served by the data API.
  # If they are, transparently redirect them with a '302: Found' status code
  def data_check
    # Check format to see if it is available from the data API
    return if !DATA_FORMATS.include?(request.formats.first) || (params[:controller] == 'constituencies' && params[:action] == 'map')

    # Find the current controller/action's API url
    @data_url = data_url

    # Catch potential nil values
    raise StandardError, 'Data URL does not exist' if @data_url.nil?

    response.headers['Accept'] = request.formats.first
    redirect_to(@data_url.call(params).query_url) && return
  end

  # Get the data URL for our current controller and action OR raise a StandardError
  #
  # @raises [StandardError] if there is no Proc available for a controller and action pair, we raise a StandardError
  #
  # @return [Proc] a Proc which can be called to generate a data URL
  def data_url
    self.class::ROUTE_MAP[params[:action].to_sym] || raise(StandardError, "You must provide a ROUTE_MAP proc for #{params[:controller]}##{params[:action]}")
  end

  # Populates @request with a data url which can be used within controllers.
  def build_request
    @request = data_url.call(params)

    populate_alternates(@request.query_url)
  end

  # Populates Pugin.alternates with a list of data formats and corresponding urls
  #
  # @param [String] url the url where alternatives can be found
  def populate_alternates(url)
    alternates = []

    DATA_FORMATS.each do |format|
      alternates << { type: format, href: url }
    end

    Pugin.alternates = alternates
  end
end
