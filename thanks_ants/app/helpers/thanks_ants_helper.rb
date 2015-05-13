module ThanksAntsHelper

  class ThanksAntsError < StandardError
  end

  protected

  # Validate and sanitise +input+ and then return the sanitised string
  def validate_input(input, action)
    sanitised_input = sanitise(input)
    raise ThanksAntsError.new("#{input} is un#{action}able") unless sanitised_input =~ /^[a-zA-Z]+( [a-zA-Z]+)*$/i
    raise ThanksAntsError.new("#{input} has no vowels") if first_vowel_index(sanitised_input).nil?
    sanitised_input
  end

  def get_append_string(input)
    after_index(input, first_vowel_index(input))
  end

  private

  def sanitise(input)
    input.squeeze(' ').strip.downcase
  end

  def first_vowel_index(string)
    string.chars.find_index { |c| 'aeiouy'.include? c }
  end

  def after_index(string, index)
    string[index, string.length]
  end 

end
