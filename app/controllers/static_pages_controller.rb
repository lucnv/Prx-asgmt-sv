class StaticPagesController < ApplicationController
  def show
    if valid_page?
      render template: "static_pages/#{params[:page]}"
    else
      raise ActionController::RoutingError.new "Not found"
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new("#{Rails.root}/app/views/static_pages/#{params[:page]}.html.erb")
  end
end
