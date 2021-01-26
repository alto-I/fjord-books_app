# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = create(:book)
    alice = create(:alice)
    sign_in_as(alice)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: @book.title
    fill_in 'メモ', with: @book.memo
    fill_in '著者', with: @book.author
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'MyString'
    assert_text 'MyText'
    assert_text 'MyName'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: 'ハンターハンター'
    fill_in 'メモ', with: 'いつ連載再開するんです？'
    fill_in '著者', with: '冨樫'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'ハンターハンター'
    assert_text 'いつ連載再開するんです？'
    assert_text '冨樫'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除'
    end

    assert_text '本が削除されました。'
  end
end
