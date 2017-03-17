require 'vcard/vcard'
require 'parliament'
require 'houses_id_helper'

class ApplicationController < ActionController::Base
  include VCardHelper
  include Parliament
  include HouseIdHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'pugin/layouts/pugin'

  rescue_from Parliament::NoContentError do |error|
    raise ActionController::RoutingError, error.message
  end
end
