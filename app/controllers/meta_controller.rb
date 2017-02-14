class MetaController < ApplicationController
  def index
    render 'meta_index'
  end

  def cookie_policy
    render 'cookie_policy'
  end
end
