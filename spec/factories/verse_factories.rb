# frozen_string_literal: true

FactoryBot.define do
  factory :verse, class: 'Verse' do
    book { 'genesis' }
    chapter { 1 }
    verse { 1 }
    raw_text { 'In the beginning' }
  end
end
