# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    alice = create(:alice)
    @report = create(:report, user_id: alice.id)
    sign_in_as(alice)
  end

  test 'Comment on the Report' do
    visit report_path(@report)
    fill_in 'comment_content', with: 'テストコメント'
    click_on 'コメントする'
    assert_text 'コメントが投稿されました。'
  end
end
