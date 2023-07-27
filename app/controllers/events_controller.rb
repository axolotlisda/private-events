class EventsController < ApplicationController
    def index
        @events = Event.all
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

    def event_params
        params.require(:event).permit(:name, :description, :location, :private, :date, :time)
    end

    def show
        @event = Event.find(params[:id])
        @attendings = Attending.all
    end
end