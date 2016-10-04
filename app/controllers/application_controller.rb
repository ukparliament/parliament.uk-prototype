require 'fetcher'

class ApplicationController < ActionController::Base
  include JSON_LD_Helper
  include QueryHelper
  include Fetcher
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'application'
  before_filter :set_constants

  def set_constants
    @layout = get_template("layout")
    @header = get_template("header")
    @footer = get_template("footer")
  end

  def index
  end
end
