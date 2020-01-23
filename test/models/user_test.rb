require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user new" do
    @user_form = { username: "username", password: "password", repassword: 'password' }
    @user = User.create_user @user_form

    assert_not_nil @user
    p @user
    assert @user.destroy

    p 'user new [passed]'
  end
end
