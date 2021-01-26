# frozen_string_literal: true

FactoryBot.define do
  factory :alice, class: User do
    name { 'Alice' }
    email { 'alice@example.com' }
    password { 'password' }
  end

  factory :bob, class: User do
    name { 'Bob' }
    email { 'bob@example.com' }
    password { 'password' }
  end

  factory :github_user, class: User do
    name { 'github_user' }
    email { 'github@example.com' }
    password { 'password' }
    provider { 'github' }
    uid { 123_456 }
  end
end
