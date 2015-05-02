class BlessYouController < ApplicationController

  include BlessYouHelper

  def bless_you
    @response = blessyou(params[:blessee])
  end

end
