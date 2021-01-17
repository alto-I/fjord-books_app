require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = create(:alice)
    @bob = create(:bob)
  end

  test 'Show Email if name is not registered.' do
    assert_equal @alice.name, @alice.name_or_email
    @alice.name = ''

    assert_equal @alice.email, @alice.name_or_email
  end

  test 'Are you able to follow?' do
    assert_not @alice.following?(@bob)

    @alice.follow(@bob)

    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test 'Are you able to unfollow?' do
    @alice.follow(@bob)
    @alice.unfollow(@bob)

    assert_not @alice.following?(@bob)
    assert_not @bob.followed_by?(@alice)
  end

  test 'Whether the user via github is already registered or not.' do
    github_user = create(:github_user)
    assert_equal User.from_omniauth(github_auth), github_user

    github_user.destroy
    assert_not_equal User.from_omniauth(github_auth), github_user
  end
end
