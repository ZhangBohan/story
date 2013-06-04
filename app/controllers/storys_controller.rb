class StorysController < ApplicationController
  def index
    @events = Event.order('effect_at').find_all_by_visible(true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
end
