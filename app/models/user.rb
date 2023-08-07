class User < ApplicationRecord

  validates :username, presence: true, uniqueness:true

  has_many :invites, foreign_key: :inviter_id, dependent: :destroy
  has_many :invites, foreign_key: :invitee_id, dependent: :destroy
  
  has_many :attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendings, dependent: :destroy

  has_many :events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

  

  # functions for attending button in views/events/show

  def attend(event)
    attended_events << event
  end

  def attending?(event)
    attended_events.include?(event)
  end

  def unattend(event)
    attended_events.delete(event)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
