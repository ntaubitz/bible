# frozen_string_literal: true

require_relative '../spec_helper'

describe VerseStats do
  let(:verses) { [FactoryBot.create(:verse)] }
  let(:subject) { described_class }

  describe '.word_stats' do
    it 'stats the beginning' do
      stats = subject.word_stats(verses: verses)
      expect(stats.keys.count).to eq(8)
      expect(stats[:god][:count]).to eq(1)
      expect(stats[:earth][:count]).to eq(1)
      expect(stats[:beginning][:count]).to eq(1)
      expect(stats[:heaven][:count]).to eq(1)
      expect(stats[:the][:count]).to eq(3)
    end
  end
end
