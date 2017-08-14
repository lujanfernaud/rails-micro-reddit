require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Dummy", email: "dummy@test.com",
                     email_confirmation: "dummy@test.com",
                     password: "dummytest",
                     password_confirmation: "dummytest")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be not valid if name is too short" do
    @user.username = "Du"
    assert_not @user.valid?
  end

  test "should be not valid if name is too long" do
    @user.username = "Duuuuuuuuuuuuuuuuuuuuuuummmmmmmmmmmmmyyyyyyyyyyyyyyyyy"
    assert_not @user.valid?
  end

  test "should be not valid if email is not correct" do
    @user.email = "adasd.asdasd.com"
    assert_not @user.valid?
  end

  test "should be not valid when missing email confirmation" do
    @user.email_confirmation = " "
    assert_not @user.valid?
  end

  test "should be not valid when email confirmation doesn't match" do
    @user.email_confirmation = "dumy@test.com"
    assert_not @user.valid?
  end

  test "should have a password" do
    @user.password = ""
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "should have a confirmation password that matches" do
    @user.password = "12345678"
    @user.password_confirmation = "122345678"
    assert_not @user.valid?
  end

  test "should be not valid is password is blank" do
    @user.password = " "
    @user.password_confirmation = " "
    assert_not @user.valid?
  end

  test "should be not valid is password is too short" do
    @user.password = "hello"
    @user.password_confirmation = "hello"
    assert_not @user.valid?
  end
end
