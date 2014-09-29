class ApplicationController < ActionController::Base
  protect_from_forgery

  helper Bootstrapped::Engine.helpers  

  before_filter :authenticate_user!
end
