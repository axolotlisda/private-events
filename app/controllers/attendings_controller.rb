class AttendingsController < ApplicationController
    def create
        event = Event.find(params[:id])
        current_user.attend(event)
        redirect_to event, notice: 'You are now attending this event'
    end

    def delete
        event = Event.find(params[:id])
        current_user.attended_events.delete(event)

        redirect_to event, notice: 'You have unattended the event.'
    end
end
