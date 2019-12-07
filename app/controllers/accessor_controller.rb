class AccessorController < ApplicationController
  def user_check
    @login_form = login_params
    @user = User.where(@login_form).take

    if @user.nil?
      flash[:notice] = '你输入的内容很有问题'
      redirect_to '/login'
    else
      render 'products/index'
    end
  end

  private

  def login_params
    params.permit :username, :password
  end
end
