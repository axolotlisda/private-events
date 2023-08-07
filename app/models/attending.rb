class Attending < ApplicationRecord

    belongs_to :attendee, class_name: 'User'
    belongs_to :attended_event, class_name: 'Event'

    validates :attended_event_id, uniqueness: { scope: [:attendee_id, :attended_event_id], message: "You are already attending" }

end
