class Invite < ApplicationRecord
    belongs_to :event
    belongs_to :inviter, class_name: 'User'
    belongs_to :invitee, class_name: 'User'
  
    validates :event_id, uniqueness: { scope: [:inviter_id, :invitee_id], message: "Invite already sent" }
    
  def accept!
    update(status: :accepted)
  end

  def decline!
    update(status: :declined)
  end

end
