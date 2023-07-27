class AttendingsController < ApplicationController
    def create
        event = Event.find(params[:id])
        current_user.attend(event)
        redirect_to event, notice: 'You are now attending this event'
    end
end
