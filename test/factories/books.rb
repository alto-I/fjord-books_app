# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'MyString' }
    memo { 'MyText' }
    author { 'MyName' }
  end
end
