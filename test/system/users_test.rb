require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'login by GitHub' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = github_auth
    visit root_url
    click_link 'GitHubでログイン'


    assert_text 'GitHub アカウントによる認証に成功しました。'
  end
end
