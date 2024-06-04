class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
  end

  helper_method :current_user

def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
end
