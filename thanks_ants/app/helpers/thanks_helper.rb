require 'thanks_ants_helper'

module ThanksHelper

  include ThanksAntsHelper

  class UnthankableError < StandardError
  end

  def thanks(thankee)
    thank_thankee(validate_input(thankee, UnthankableError, "thank"), thankee)
  end

  private

  def thank_thankee(first_vowel_index, thankee)
    "Th#{after_index(thankee, first_vowel_index)}"
  end

end
