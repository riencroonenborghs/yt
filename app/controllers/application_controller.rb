class ApplicationController < ActionController::Base
  protect_from_forgery

  helper BootstrapBuilder::Engine.helpers  

  # before_filter :authenticate_user!
end
