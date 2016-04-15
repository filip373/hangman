require 'yaml'

class GameFile

  def initialize(filename)
    @filename = filename
  end

  def save(game_progress)
    File.open(@filename, 'w') do |file|
      file.puts(YAML::dump(game_progress))
    end
    puts 'Game saved!'
  end

  def load
    YAML::load(File.read(@filename))
  end

end
