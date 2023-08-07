class InvitationsController < ApplicationController
  
  def index
    @invitations = current_user.invites
    process_invitations
  end

  def accept
    invitation = current_user.invites.find(params[:id])
    invitation.accept!
    redirect_to invitations_path, notice: 'Invitation accepted.'
  end

  def decline
    invitation = current_user.invites.find(params[:id])
    invitation.decline!
    redirect_to invitations_path, notice: 'Invitation declined.'
  end

  def process_invitations
    @invitations.each do |invitation|
      if invitation.status == 'accepted'
        user = invitation.invitee
        event = invitation.event
        unless user.attending?(event)
          user.attend(event)
        end
        invitation.destroy
      elsif invitation.status == 'declined'
        invitation.destroy
      end
    end
  end

end
