class DictionaryWord

  def initialize(filename, size_min, size_max)
    @filename = filename
    @size_min = size_min
    @size_max = size_max
  end

  def random
    count = File.foreach(@filename).reduce(0) { |c, line| c + 1 }
    word = ''
    loop do
      num = rand(count)
      file = File.open(@filename)
      num.times do
        word = file.gets.chomp
      end
      file.close
      break if word.size.between?(@size_min, @size_max)
    end
    word
  end

end
