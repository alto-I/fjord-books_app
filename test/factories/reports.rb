# frozen_string_literal: true

FactoryBot.define do
  factory :report do
    user_id { '' }
    title { 'ハンターハンター' }
    content { 'いつ再開するんです？' }
  end
end
