require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'DJ HIRROT', email: 'dj_hirrot@auth.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be preset' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'name should be not be too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'email should be not be too long' do
    @user.email = 'a' * 247 + '@auth.com' # 247 + 9 = 256
    assert_not @user.valid?
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@example.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.nc]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation should reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@exaple.foo@baz_baz.com foo@baz+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
