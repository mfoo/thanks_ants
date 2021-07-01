class ThanksController < ApplicationController
  include ThanksHelper

  def thank
    render json: { thanks: thanks(params.require(:thankee)) }
  end
end
