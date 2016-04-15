class ValidatedLetter

  def initialize(input)
    @input = input
  end

  def get
    raise 'Invalid input' unless @input.size == 1 && @input.downcase =~ /[a-z]/
    @input.downcase
  end

end
