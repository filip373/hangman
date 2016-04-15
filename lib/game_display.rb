class GameDisplay

  def initialize(placeholder, the_word)
    @placeholder = placeholder
    @the_word = the_word
  end

  def guess_res(result)
    puts result ? 'Correct!' : 'Incorrect'
  end

  def prompt_letter(try_num)
    puts "#{try_num} tries left, specify a letter: "
  end

  def progress(progress_arr)
    raise 'Incorrect blank letter' if @placeholder.to_s.size != 1
    puts progress_arr.map { |p| p.nil? ? @placeholder : p }.join
  end

  def start_game(progress_arr)
    progress(progress_arr)
    puts "Size: #{@the_word.size}"
  end

  def end_game(result)
    puts result ? 'You won!' : 'You lost!'
    puts "The word was: #{@the_word}"
  end

end
