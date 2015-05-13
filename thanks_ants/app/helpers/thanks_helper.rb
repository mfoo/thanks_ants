require 'thanks_ants_helper'

module ThanksHelper

  include ThanksAntsHelper

  def thanks(thankee)
    thank_thankee(validate_input(thankee, "thank"))
  end

  private

  def thank_thankee(thankee)
    "Th#{get_append_string(thankee)}"
  end

end
