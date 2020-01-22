class AccessorController < ApplicationController

  skip_before_action :before_require_login, only: [
    :user_check,
    :create_user,
  ]

  # User login check Auth
  # @author SDTTTTT
  def user_check
    @login_form = login_params

    @user = User.find_by @login_form
    if @user.nil?
      flash[:notice] = '你输入的内容很有问题'
      redirect_to '/login'
    else
      store_crrent_user @user
      redirect_to products_path
    end
  end

  def create_user
    @register_form = register_params
    @result = User.create_user @register_form

    if @result.instance_of? User
      unless @result.errors.nil?
        store_crrent_user @result
        redirect_to products_path
      else
        flash[:notice] = 'Sorry! User create Failed'
      end
    else
      case @result
      when -1
        flash[:notice] = 'User have Exist'
      when -2
        flash[:notice] = 'you Password Error'
      end
    end
  end

  def logout
    destroy_crrent_user
    flash[:notice] = 'You have logged out.'
    redirect_to login_path
  end

  private

  def destroy_crrent_user
    session.delete :crrent_user
  end

  def store_crrent_user user
    session[:crrent_user] = {
        uid: user.id,
        username: user.username,
    }
  end

  def login_params
    params.require(:user).permit :username, :password
  end

  def register_params
    params.require(:register_form).permit :username, :password, :repassword
  end
end
