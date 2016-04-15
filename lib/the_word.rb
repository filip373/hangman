class TheWord

  def initialize(word)
    @word = word
  end

  def guess(letter)
    positions_letters = {}
    @word.split('').each_with_index { |l, i| positions_letters[i] = l if l.downcase == letter }
    positions_letters
  end

  def is?(word)
    @word == word
  end

  def size
    @word.size
  end

  def to_s
    @word
  end

end
