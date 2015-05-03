module BlessYouHelper

  include ThanksAntsHelper

  class UnblessableError < StandardError
  end

  public

  def blessyou(blessee)
    bless_blessee(validate_input(blessee, UnblessableError, "bless"))
  end

  private

  def bless_blessee(blessee)
    "Bl#{get_append_string(blessee)}"
  end

end
