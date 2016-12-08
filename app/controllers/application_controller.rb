require 'grom'
require 'vcard/vcard'

class ApplicationController < ActionController::Base
  include JSON_LD_Helper
  include FormatHelper
  include Grom::Helpers
  include NotFoundHelper
  include VCardHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'

  def index
  end

  def a_to_z
    @root_path = request.path
  end
end
