module ThanksAntsHelper

  protected

  # Validate the input and then returns the index of the first vowel into the
  # provided +input+.
  def validate_input(input, error_class, action)
    sanitise!(input)
    raise error_class.new("#{input} is un#{action}able") unless input =~ /^[a-zA-Z]+( [a-zA-Z]+)*$/i

    fvi = first_vowel_index(input)
    raise error_class.new("#{input} has no vowels") unless fvi

    fvi
  end

  private

  def sanitise!(input)
    input.squeeze!(' ')
    input.strip!
    input.downcase!
  end

  def first_vowel_index(string)
    string.chars.find_index { |c| 'aeiouy'.include? c }
  end

  def after_index(string, index)
    string[index, string.length]
  end 

end
