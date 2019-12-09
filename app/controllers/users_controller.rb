class UsersController < ApplicationController

  skip_before_action :before_require_login , only: [
    :login,
    :register,
  ]

  def login
    @user = User.new
  end

  def register
  end
end
