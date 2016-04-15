class GameProgress

  attr_reader :tries_left

  def initialize(the_word, tries_left)
    @the_word = the_word
    @tries_left = tries_left
    @specified = []
    @word_progress = Array.new(@the_word.size)
  end

  def guess(letter)
    raise 'All tries used' if @tries_left == 0
    raise 'Letter already specified.' if specified?(letter)
    @specified.push(letter)
    guess = @the_word.guess(letter)
    guess.each { |k, v| @word_progress[k] = v }
    @tries_left -= 1 if guess.empty?
    !guess.empty?
  end

  def specified?(letter)
    @specified.include?(letter)
  end

  def finished?
    won? || @tries_left == 0
  end

  def won?
    @word_progress.none? { |l| l.nil? }
  end

  def get
    @word_progress
  end

  def word
    @the_word
  end

end