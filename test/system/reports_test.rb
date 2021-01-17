require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    alice = create(:alice)
    @report = create(:report, user_id: alice.id)
    sign_in_as(alice)
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text 'タイトル'
    assert_text '作成者'
    assert_text '作成日'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '登録する'

    assert_text 'ハンターハンター'
    assert_text 'いつ再開するんです？'
    assert_text 'Alice'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'ハイスコアガール'
    fill_in '内容', with: 'インド人を右に'
    click_on '更新する'

    assert_text 'ハイスコアガール'
    assert_text 'インド人を右に'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '日報が削除されました'
  end
end
