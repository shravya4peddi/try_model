require 'test_helper'

class DetailTest < ActiveSupport::TestCase
   def setup
    @detail = Detail.new(name: "Example User", email: "user@example.com",password: "chocobar", password_confirmation: "chocobar")
   end
  #test "should be valid" do
   #  assert @user.valid?
  #end
  test "name should be present" do
    @detail.name = "     "
    assert_not @detail.valid?
  end
  
  test "email should be present" do
    @detail.email = "     "
    assert_not @detail.valid?
  end
  test "name should not be too long" do
    @detail.name = "a" * 10
    assert_not @detail.valid?
  end

  test "email should not be too long" do
    @detail.email = "a" * 10 + "@example.com"
    assert_not @detail.valid?
  end
  #test "email validation should accept valid addresses" do
   # valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                        # first.last@foo.jp alice+bob@baz.cn]
   # valid_addresses.each do |valid_address|
     # @user.email = valid_address
     # assert @user.valid?, "#{valid_address.inspect} should be valid"
    #end
 # end
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @detail.email = invalid_address
      assert_not @detail.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
   test "email addresses should be unique" do
    duplicate_user = @detail.dup
    duplicate_user.email = @detail.email.upcase
    @detail.save
    assert_not duplicate_user.valid?
  end
   test "password should have a minimum length" do
    @detail.password = @detail.password_confirmation = "a" * 5
    assert_not @detail.valid?
  end
end


