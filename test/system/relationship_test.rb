require 'application_system_test_case'

class RelationshipsTest < ApplicationSystemTestCase
  setup do
    @alice = create(:alice)
    @bob = create(:bob)
    sign_in_as(@alice)
  end

  test 'follow?' do
    visit user_path(@bob)
    click_on 'フォローする'

    assert_text 'フォローしました。'
  end

  test 'unfollow?' do
    @alice.follow(@bob)
    visit user_path(@bob)
    click_on 'フォロー解除する'

    assert_text 'フォロー解除しました。'
  end
end
