class User < ApplicationRecord
  validates :username , presence: true , length: { minimum: 4 , maximum: 20 }
  validates :password , presence: true , length: { minimum: 7 , maximum: 24 }

  def self.check_not_exist? login_form
    @user = User.where(login_form).take
    @user.nil?
  end

  def self.get condition
    self.where(condition).take
  end

  # User Create
  # if user have exist
  # @return -1
  # if user form check failed
  # @return -2
  # if user fail create
  # @return user
  # if user success create
  # @return user
  def self.create_user reg_f
    @new_user_info = form_build reg_f

    if @new_user_info.nil?
      # -2 is result of User Form check Failed
      return -2
    end

    if self.check_not_exist? @new_user_info
      @user = self.new @new_user_info
      @user.save
      @user
    else
      # -1 is result of User have exist
      -1
    end
  end

  private

  def self.form_build reg_f
    if reg_f[:password].eql? reg_f[:repassword]
      { username: reg_f[:username], password: reg_f[:repassword] }
    else
      nil
    end
  end

end
