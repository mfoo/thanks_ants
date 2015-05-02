module BlessYouHelper

  include ThanksAntsHelper

  class UnblessableError < StandardError
  end

  public

  def blessyou(blessee)
    bless_blessee(validate_input(blessee, UnblessableError, "bless"), blessee)
  end

  private

  def bless_blessee(first_vowel_index, blessee)
    "Bl#{after_index(blessee, first_vowel_index)}"
  end

end
