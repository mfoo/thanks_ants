class ThanksController < ApplicationController

  include ThanksHelper

  def thank
    @response = thanks(params[:thankee])
  end

end
