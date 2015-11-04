class EventsController < ApplicationController
before_action :user_authorized, except: [:index,:show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.host = current_user.host
    event.save
    redirect_to event_path(event)
  end

  def show
    @event = Event.find(params[:id])
    # giphy_client = Adapters::GiphyClient.new
    # @tags = @event.tags
    # @gif_urls = []
    # @event.tags.each do |tag|
      # @gif_urls << giphy_client.find_by_tag(tag.name.gsub(' ','+'))
    # end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(event)
  end

  private

  def event_params
    params.require(:event).permit(:title, :day, :start_time, :end_time, :description, :location)
  end
  
end
