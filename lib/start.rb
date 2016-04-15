require './lib/game'
require './lib/game_progress'
require './lib/game_display'
require './lib/the_word'
require './lib/dictionary_word'
require './lib/game_file'

puts "Load game: 'l', New Game: other key"
input = gets.chomp

game_file = GameFile.new('game_file.txt')
game_progress = ''
if input == 'l'
  game_progress = game_file.load  
  else
  game_progress = GameProgress.new(TheWord.new(DictionaryWord.new('dictionary.txt', 5, 12).random), 12)
end

Game.new(
  game_progress,
  GameDisplay.new('*'),
  game_file
  ).start
