require './lib/game'
require './lib/game_progress'
require './lib/game_display'
require './lib/the_word'
require './lib/dictionary_word'

the_word = TheWord.new(DictionaryWord.new('dictionary.txt', 5, 12).random)

Game.new(
  GameProgress.new(the_word, 12),
  GameDisplay.new('*', the_word)
  ).start
