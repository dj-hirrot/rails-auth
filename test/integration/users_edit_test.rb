require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:hiroto)
  end

  test 'unsuccessful edit' do
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
end
