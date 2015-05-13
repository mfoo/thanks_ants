class ThingController < ApplicationController
  include ThanksAntsHelper

  def thing
    render :text => get_message(params)
  end

  def get_message(params)
    "#{params[:thing][0..first_vowel_index(params[:thing])-1]}#{after_index(params[:thingee], first_vowel_index(params[:thingee]))}"
  end

end
