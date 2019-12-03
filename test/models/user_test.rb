require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'DJ HIRROT', email: 'dj_hirrot@auth.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end
end
