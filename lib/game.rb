require './lib/validated_letter'

class Game

  def initialize(game_progress, game_display, game_file)
    @game_progress = game_progress
    @game_display = game_display
    @game_file = game_file
  end

  def start
    clear_terminal
    @game_display.start_game(@game_progress.get, @game_progress.word.size)
    until @game_progress.finished? do
      letter = next_letter
      @game_display.guess_res(@game_progress.guess(letter))
      @game_display.progress(@game_progress.get)
    end
    @game_display.end_game(@game_progress.won?, @game_progress.word)
  end

  private

  def next_letter
    @game_display.prompt_letter(@game_progress.tries_left)
    letter = ''
    loop do
      input = gets.chomp
      if input == '!'
        @game_file.save(@game_progress)
      else
        letter = ValidatedLetter.new(input).get
        if @game_progress.specified?(letter)
          puts "'#{letter}' letter already specified"
        else
          break
        end
      end
    end
    clear_terminal
    letter
  end

  def clear_terminal
    system('cls') || system('clear')
  end

end
