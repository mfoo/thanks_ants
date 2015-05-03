require 'thanks_ants_helper'

module ThanksHelper

  include ThanksAntsHelper

  class UnthankableError < StandardError
  end

  def thanks(thankee)
    thank_thankee(validate_input(thankee, UnthankableError, "thank"))
  end

  private

  def thank_thankee(thankee)
    "Th#{get_append_string(thankee)}"
  end

end
