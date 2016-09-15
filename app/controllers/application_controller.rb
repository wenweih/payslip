class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_404
  end

  rescue_from ActiveRecord::RecordNotUnique do |exception|
    render_404
  end

  def render_404
    render file: Rails.root.join("public", "404"), layout: false, status: "404"
  end
end
