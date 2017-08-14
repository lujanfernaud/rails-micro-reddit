require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Dummy", email: "dummy@test.com",
                     email_confirmation: "dummy@test.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user should be not valid if name is too short" do
    @user.username = "Du"
    assert_not @user.valid?
  end

  test "user should be not valid if name is too long" do
    @user.username = "Duuuuuuuuuuuuuuuuuuuuuuummmmmmmmmmmmmyyyyyyyyyyyyyyyyy"
    assert_not @user.valid?
  end

  test "user should be not valid if email is not correct" do
    @user.email = "adasd.asdasd.com"
    assert_not @user.valid?
  end

  test "user should be not valid when missing email confirmation" do
    @user.email_confirmation = " "
    assert_not @user.valid?
  end

  test "user should be not valid when email confirmation doesn't match" do
    @user.email_confirmation = "dumy@test.com"
    assert_not @user.valid?
  end
end
