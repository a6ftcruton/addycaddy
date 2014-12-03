class AboutController < ApplicationController

  def show
    render 'about/how-it-works'
  end

  def api_info
    render 'about/api-info'
  end
end
