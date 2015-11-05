class EventsController < ApplicationController
  before_action :user_authorized, except: [:index,:show]

  def index
    @events = Event.sort_by_day
  end

  def new
    @event = Event.new
  end

  def create
<<<<<<< HEAD
    @event = Event.new(event_params)
    @event.host = current_user.host
    @event.title = @event.title.capitalize
      if  @event.validate_day? && @event.save
        redirect_to event_path(@event)
      elsif !@event.validate_day?
          flash[:notice] = "Invalid date"
          redirect_to new_event_path , notice: "Invalid date"
       elsif !@event.save
        render 'new'
      end
=======
    event = Event.new(event_params)
    event.host = current_user.host  
    if event.save
      redirect_to event_path(event)
    else
      redirect_to new_event_path
    end
>>>>>>> be4d37dbf83e8e08df76a716aaef37af6a818d69
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
    if !permission_to_edit?(@event.host.user)
      flash[:notice] = "You do not have permission to edit this event."
      render 'show'
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to event_path(event)
  end


  private

  
  def event_params
    params.require(:event).permit(:title, :day, :start_time, :end_time, :description, :location, tag_ids: [], tags_attributes: [:name])
  end
  
end
