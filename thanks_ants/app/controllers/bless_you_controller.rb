class BlessYouController < ApplicationController
  include BlessYouHelper

  def bless_you
    render json: { blessyou: blessyou(params.require(:blessee)) }
  end
end
