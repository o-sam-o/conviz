class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_cache_headers

private

  def set_cache_headers
    response.headers["Cache-Control"] = "public, max-age=3600"
  end

end
