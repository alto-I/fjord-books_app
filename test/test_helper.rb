# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  def github_auth
    OmniAuth::AuthHash.new({
                             provider: 'github',
                             uid: '123456',
                             info: {
                               name: 'github_user',
                               email: 'github@example.com'
                             }
                           })
  end

  parallelize(workers: :number_of_processors)
end
