class EventsController < ApplicationController
  def index
    @provider = Provider.find(params[:provider_id])
    @events  = @provider.events
  end
end
