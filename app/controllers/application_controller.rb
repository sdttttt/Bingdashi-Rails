class ApplicationController < ActionController::Base

  before_action :before_require_login

  private

  def before_require_login
    if session[:crrent_user].nil?
      flash[:notice] = '您必须先登录才能这么做'
      redirect_to login_path
    end
  end
end
