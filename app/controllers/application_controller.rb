class ApplicationController < ActionController::Base

  # TODO 在Coding Studio 环境下这个需要被开启
  # 不然可能因为WebIDE内部的转发而导致无效的Authenticity_token
  skip_before_action :verify_authenticity_token

  before_action :before_require_login
  
  protected
  # Get Crrent User Infomation
  def crrent_user
    User.find session[:crrent_user]['uid']
  end

  private

  def before_require_login
    if session[:crrent_user].nil?
      flash[:notice] = '您必须先登录才能这么做'
      redirect_to login_path
    end
  end
end
