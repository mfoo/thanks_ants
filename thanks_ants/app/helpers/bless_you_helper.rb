module BlessYouHelper

  include ThanksAntsHelper

  public

  def blessyou(blessee)
    bless_blessee(validate_input(blessee, "bless"))
  end

  private

  def bless_blessee(blessee)
    "Bl#{get_append_string(blessee)}"
  end

end
