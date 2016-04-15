class GameDisplay

  def initialize(placeholder)
    @placeholder = placeholder
  end

  def guess_res(result)
    puts result ? 'Correct!' : 'Incorrect'
  end

  def prompt_letter(try_num)
    puts "#{try_num} tries left, specify a letter or ! to save: "
  end

  def progress(progress_arr)
    raise 'Incorrect blank letter' if @placeholder.to_s.size != 1
    puts progress_arr.map { |p| p.nil? ? @placeholder : p }.join
  end

  def start_game(progress_arr, word_size)
    progress(progress_arr)
    puts "Size: #{word_size}"
  end

  def end_game(result, word)
    puts result ? 'You won!' : 'You lost!'
    puts "The word was: #{word}"
  end

end
