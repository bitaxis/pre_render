class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ##
  # This methods should exist, otherwise we have not written the gem
  # correctly.

  def hello
    logger.info ">>>>>"
    logger.info ">>>>> Hello, world!"
    logger.info ">>>>>"
  end

end
