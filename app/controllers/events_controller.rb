class EventsController < ApplicationController
    def index
        @events = Event.all
        @past_events = Event.past
        @upcoming_events = Event.upcoming
        @ongoing_events = Event.ongoing
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to @event, notice: 'Event was succesfully created'
        else
            render :new
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to events_path, notice: "User updated succesfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def event_params
        params.require(:event).permit(:name, :description, :location, :private, :date, :time)
    end

    def show
        
        @event = Event.find(params[:id])
        @attendings = Attending.all
        
        @invite = Invite.new

    end

    def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully deleted.'
  end


   private
   
    def event_params
        params.require(:event).permit(:name, :description, :location, :private, :date, :time)
    end

end