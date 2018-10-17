class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session #:exception
  # CSRF を避けるために、上記 :exception から :null_session に変更した

  before_action :set_current_user
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  # ログインに関わるもの
  # def authenticate_user
  #   if @current_user = nil
  #     flash[:notice] = "ログインが必要です"
  #     redirect_to('/login')
  #   end
  # end
  #
  # def forbid_login_user
  #   if @current_user
  #     flash[:nocice] = "すでにログインしています"
  #     redirect_to("/posts/index")
  #   end
  # end
end
