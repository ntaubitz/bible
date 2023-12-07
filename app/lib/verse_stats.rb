class VerseStats
  def self.word_stats(verses:)
    words = {}
    verses.each do |verse|
      parse_words(text: verse.raw_text).each do |word|
        unless words.include?(word)
          words[word] = {count: 0}
        end
        words[word][:count] += 1
      end
    end
    words.with_indifferent_access
  end

  def self.parse_words(text:)
    text.split.map{|word| word.gsub(/[^0-9a-z ]/i, '').downcase}
  end
end