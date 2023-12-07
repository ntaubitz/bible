# frozen_string_literal: true

require_relative '../spec_helper'

describe Verse do
  let(:verse) { FactoryBot.create(:verse)}

  it 'things' do
    puts "***** #{verse.inspect}"
    expect(verse.book).to eq("genesis")
    expect(1).to eq(Verse.count)

  end
end
