class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: "Event", dependent: :destroy

  has_many :attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendings, dependent: :destroy

  # functions for attending button in views/events/show

  def attend(event)
    attended_events << event
  end

  def attending?(event)
    attended_events.include?(event)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
