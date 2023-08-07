# app/controllers/invites_controller.rb
class InvitesController < ApplicationController
  before_action :set_event

  def create
  
    
    @event = Event.find(params[:id])
    @invite = @event.invites.build(invite_params)
    @invite.inviter = current_user
    @invite.status = 'pending'

    puts "@invite: #{@invite}"

    if @invite.save
      redirect_to @event, notice: 'Invitation sent successfully.'
    else
      redirect_to @event, alert: 'You already have a pending invitation'
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:event_id,:inviter_id,:invitee_id,:status)
  end
end
