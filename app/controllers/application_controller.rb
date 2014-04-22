class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Include helpers/sessions_helper.rb for use in controllers and views.
  include SessionsHelper
end
