require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiroto)
    @other_user = users(:naoki)
  end

  test 'unsuccessful edit' do
    login_as(@user)

    get edit_user_path(@user)
    assert_template 'users/edit'

    patch user_path(@user), params: {
      user: {
        name: '',
        email: 'fail@invalid',
        password: 'too',
        password_confirmation: 'short'
      }
    }

    assert_template 'users/edit'

    assert_select '.alert-danger', 'The form contains 4 errors.'
  end

  test 'successful edit' do
    login_as(@user)

    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'FooBar'
    email = 'foo@bar.com'
    patch user_path(@user), params: {
      user: {
        name: name,
        email: email,
        password: '',
        password_confirmation: ''
      }
    }
    assert_not flash[:success].nil?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test 'should redirect edit when not logged in' do
    login_as(@other_user)

    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test 'should redirect update when not logged in' do
    login_as(@other_user)

    patch user_path(@user), params: {
      user: {
        name: @user.name,
        email: @user.email
      }
    }
    assert flash.empty?
    assert_redirected_to root_url
  end
end
