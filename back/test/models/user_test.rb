require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.create(
      email: "jack@example.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  test "user has an authentication_token" do
    assert { @user.authentication_token != nil }
  end

  test "the password doesn't persist" do
    assert_nil User.first.password
  end
end
