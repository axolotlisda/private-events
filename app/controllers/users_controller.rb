class UsersController < ApplicationController
    before_action :authenticate_user!

    # def index
    #     @users = User.all
    # end
    def index
        @users = User.includes(attendings: :attendee)
    end

    def show
        @attended_events = current_user.attended_events
    end
end
