class Event < ApplicationRecord

    validates :name, presence: true, uniqueness:true, length: { minimum: 3, maximum: 50}
    validates :description, presence: true
    validates :date, presence: true
    validates :time, presence: true


    has_many :invites, dependent: :destroy
    has_many :attendings, foreign_key: :attended_event_id, dependent: :destroy
    has_many :attendees, through: :attendings, dependent: :destroy
    belongs_to :creator, class_name: "User"
    
    scope :past, -> { where("date < ?", Date.today) }
    
    scope :upcoming, -> { where("date > ?", Date.today) }

    scope :ongoing, -> { where("date == ?", Date.today) }
end
