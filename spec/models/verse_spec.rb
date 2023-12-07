# frozen_string_literal: true

require_relative '../spec_helper'

describe Verse do
  let(:verse) { FactoryBot.create(:verse)}

  it 'things' do
    expect(verse.book).to eq("genesis")
  end
end
