class UsersController < ApplicationController
    before_action :authenticate_user!

    # def index
    #     @users = User.all
    # end
    def index
        @user = current_user
    end

    def show
        @attended_events = current_user.attended_events
        
    end

    def delete_event
        @event = current_user.events.find(params[:id])
        @event.destroy
        redirect_to events_path, notice: 'Event was successfully deleted.'
    end
end
