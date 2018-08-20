require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    # get one user from fixtures/users.yml
    @user = users(:michael)
    remember(@user)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    # ランダムなトークンを新しく発生させremember_digestを更新
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end
end